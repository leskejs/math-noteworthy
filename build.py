import os
import sys
import json
import subprocess
import shutil
import argparse
import zipfile
import hashlib
import time
from pathlib import Path
from multiprocessing import Pool, cpu_count
from functools import partial

# Configuration
BUILD_DIR = Path("build")
CACHE_DIR = BUILD_DIR / ".cache"
OUTPUT_FILE = Path("output.pdf")
RENDERER_FILE = "renderer.typ"

def check_dependencies():
    """Check if required tools are installed."""
    if shutil.which("typst") is None:
        print("Error: 'typst' executable not found in PATH.")
        sys.exit(1)
    if shutil.which("pdfinfo") is None:
        print("Error: 'pdfinfo' executable not found in PATH.")
        print("Install with: brew install poppler")
        sys.exit(1)

def get_pdf_page_count(pdf_path):
    """Get the number of pages in a PDF file using pdfinfo."""
    try:
        result = subprocess.run(
            ["pdfinfo", str(pdf_path)],
            capture_output=True,
            text=True,
            check=True
        )
        for line in result.stdout.split('\n'):
            if line.startswith('Pages:'):
                return int(line.split(':')[1].strip())
        return 0
    except (subprocess.CalledProcessError, ValueError) as e:
        print(f"Error getting page count for {pdf_path}: {e}")
        return 0


def extract_hierarchy():
    """Extract document hierarchy from config.typ using typst query."""
    print("Extracting document hierarchy...")
    
    temp_file = Path("extract_hierarchy.typ")
    temp_file.write_text('#import "config.typ": hierarchy\n#metadata(hierarchy) <hierarchy>')
    
    try:
        result = subprocess.run(
            ["typst", "query", str(temp_file), "<hierarchy>"],
            capture_output=True,
            text=True,
            check=True
        )
        data = json.loads(result.stdout)
        return data[0]["value"]
    except subprocess.CalledProcessError as e:
        print(f"Error extracting hierarchy: {e.stderr}")
        sys.exit(1)
    finally:
        if temp_file.exists():
            temp_file.unlink()

def get_cache_file():
    """Get the path to the cache metadata file."""
    return CACHE_DIR / "build_cache.json"

def load_cache():
    """Load build cache from disk."""
    cache_file = get_cache_file()
    if cache_file.exists():
        with open(cache_file, 'r') as f:
            return json.load(f)
    return {}

def save_cache(cache):
    """Save build cache to disk."""
    CACHE_DIR.mkdir(parents=True, exist_ok=True)
    cache_file = get_cache_file()
    with open(cache_file, 'w') as f:
        json.dump(cache, f, indent=2)

def get_file_hash(filepath):
    """Get MD5 hash of a file's contents."""
    if not Path(filepath).exists():
        return None
    hasher = hashlib.md5()
    with open(filepath, 'rb') as f:
        hasher.update(f.read())
    return hasher.hexdigest()

def get_dependencies(target, hierarchy):
    """Get list of files that a target depends on."""
    deps = [
        "config.typ",
        "templates/parser.typ",
        "templates/templater.typ",
        RENDERER_FILE
    ]
    
    # Add content file for page targets
    if "." in target and target not in ["cover", "preface", "outline"]:
        # This is a page like "08.01"
        chapter_id = target[:2]
        content_file = f"content/chapter {chapter_id}/{target}.typ"
        deps.append(content_file)
    
    # Add template files
    for template_dir in ["templates/plots", "templates/covers", "templates/blocks"]:
        if Path(template_dir).exists():
            for typ_file in Path(template_dir).glob("*.typ"):
                deps.append(str(typ_file))
    
    return deps

def needs_recompile(target, output_path, cache, hierarchy, force=False):
    """Check if a target needs to be recompiled."""
    if force:
        return True
    
    if not Path(output_path).exists():
        return True
    
    target_key = str(output_path)
    if target_key not in cache:
        return True
    
    cached_data = cache[target_key]
    
    # Check if any dependency has changed
    deps = get_dependencies(target, hierarchy)
    for dep in deps:
        dep_path = Path(dep)
        if not dep_path.exists():
            continue
        
        current_hash = get_file_hash(dep_path)
        cached_hash = cached_data.get("deps", {}).get(dep)
        
        if current_hash != cached_hash:
            return True
    
    return False

def update_cache_entry(cache, target, output_path, hierarchy):
    """Update cache entry for a compiled target."""
    target_key = str(output_path)
    deps = get_dependencies(target, hierarchy)
    
    dep_hashes = {}
    for dep in deps:
        dep_path = Path(dep)
        if dep_path.exists():
            dep_hashes[dep] = get_file_hash(dep_path)
    
    cache[target_key] = {
        "target": target,
        "compiled_at": time.time(),
        "deps": dep_hashes
    }

def compile_target(target, output_path, page_offset=None, page_map=None):
    """Compile a specific target to PDF."""
    print(f"Compiling target: {target} -> {output_path}")
    
    cmd = [
        "typst", "compile", 
        RENDERER_FILE, 
        str(output_path),
        "--input", f"target={target}"
    ]
    
    if page_offset is not None:
        cmd.extend(["--input", f"page-offset={page_offset}"])
    
    if page_map is not None:
        # Pass JSON string without escaping quotes since we're using single quotes in shell
        page_map_json_str = json.dumps(page_map)
        cmd.extend(["--input", f"page-map={page_map_json_str}"])
    
    try:
        subprocess.run(cmd, check=True, capture_output=True)
    except subprocess.CalledProcessError as e:
        print(f"Error compiling {target}:")
        print(e.stderr.decode())
        sys.exit(1)

def merge_pdfs_with_command(pdf_files, output_path):
    """Merge multiple PDFs using command-line tools."""
    # Filter out non-existent files
    existing_files = [str(pdf) for pdf in pdf_files if pdf.exists()]
    
    if not existing_files:
        print("No PDF files to merge!")
        return
    
    print(f"Merging {len(existing_files)} files into {output_path}...")
    
    # Try pdfunite first (from poppler-utils)
    if shutil.which("pdfunite"):
        cmd = ["pdfunite"] + existing_files + [str(output_path)]
        try:
            subprocess.run(cmd, check=True, capture_output=True)
            print(f"Successfully merged PDFs using pdfunite")
            return
        except subprocess.CalledProcessError as e:
            print(f"pdfunite failed: {e.stderr.decode()}")
    
    # Try ghostscript as fallback
    if shutil.which("gs"):
        cmd = [
            "gs", "-dBATCH", "-dNOPAUSE", "-q", "-sDEVICE=pdfwrite",
            f"-sOutputFile={output_path}"
        ] + existing_files
        try:
            subprocess.run(cmd, check=True, capture_output=True)
            print(f"Successfully merged PDFs using ghostscript")
            return
        except subprocess.CalledProcessError as e:
            print(f"ghostscript failed: {e.stderr.decode()}")
    
    # If both fail, print warning
    print(f"Warning: No PDF merge tool found (tried pdfunite and gs)")
    print("Individual PDFs are available in the build/ directory")
    print("To install a merge tool:")
    print("  - macOS: brew install poppler")
    print("  - Linux: apt-get install poppler-utils or ghostscript")

def compile_target_worker(args):
    """Worker function for parallel compilation."""
    target, output_path, page_offset, page_map = args
    try:
        compile_target(target, output_path, page_offset, page_map)
        return (True, target, output_path)
    except Exception as e:
        return (False, target, str(e))

def compile_targets_parallel(targets_args, num_jobs=None):
    """Compile multiple targets in parallel using multiprocessing.
    
    Args:
        targets_args: List of tuples (target, output_path, page_offset, page_map)
        num_jobs: Number of parallel jobs (default: CPU count)
    
    Returns:
        List of successfully compiled output paths
    """
    if num_jobs is None:
        num_jobs = max(1, cpu_count() - 1)  # Leave one CPU free
    
    print(f"Compiling {len(targets_args)} targets using {num_jobs} parallel jobs...")
    
    with Pool(processes=num_jobs) as pool:
        results = pool.map(compile_target_worker, targets_args)
    
    # Check for errors
    successful_outputs = []
    for success, target, output_or_error in results:
        if success:
            successful_outputs.append(output_or_error)
        else:
            print(f"ERROR compiling {target}: {output_or_error}")
            sys.exit(1)
    
    return successful_outputs

def zip_build_directory(build_dir, output_file="build_pdfs.zip"):
    """Zip the build directory for archival."""
    print(f"Zipping build directory to {output_file}...")
    with zipfile.ZipFile(output_file, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(build_dir):
            for file in files:
                file_path = Path(root) / file
                arcname = file_path.relative_to(build_dir.parent)
                zipf.write(file_path, arcname)
    print(f"Created {output_file}")

def main():
    parser = argparse.ArgumentParser(description="Build Noteworthy framework documentation")
    parser.add_argument(
        "--leave-individual",
        action="store_true",
        help="Keep individual PDFs as a zip file instead of deleting them"
    )
    parser.add_argument(
        "--jobs", "-j",
        type=int,
        default=None,
        help="Number of parallel compilation jobs (default: CPU count - 1)"
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="Force rebuild all targets, ignoring cache"
    )
    args = parser.parse_args()
    
    check_dependencies()
    
    # Load cache before potentially cleaning build directory
    cache = load_cache() if not args.force else {}
    
    # Create build directory if it doesn't exist (don't clean it for incremental builds)
    if args.force and BUILD_DIR.exists():
        print("Force rebuild: Cleaning build directory...")
        shutil.rmtree(BUILD_DIR)
    BUILD_DIR.mkdir(exist_ok=True)
    
    hierarchy = extract_hierarchy()
    
    print("\n" + "="*60)
    print("PASS 1: Compiling sections and tracking page counts")
    if not args.force:
        print("(Using incremental build cache)")
    print("="*60 + "\n")
    
    # Page tracking
    page_map = {}  # {section_id: starting_page}
    current_page = 1
    pdf_files = []
    
    # Collect all targets to compile
    targets_to_compile = []
    compilation_tasks = []  # (target, output, msg, is_cover/preface/outline)
    
    # 1. Cover
    target = "cover"
    output = BUILD_DIR / "00_cover.pdf"
    if needs_recompile(target, output, cache, hierarchy, args.force):
        targets_to_compile.append((target, output, None, None))
    else:
        print(f"  ✓ Cover (cached)")
    compilation_tasks.append((target, output, "Cover", True))
    pdf_files.append(output)
    
    # 2. Preface
    target = "preface"
    output = BUILD_DIR / "01_preface.pdf"
    if needs_recompile(target, output, cache, hierarchy, args.force):
        targets_to_compile.append((target, output, None, None))
    else:
        print(f"  ✓ Preface (cached)")
    compilation_tasks.append((target, output, "Preface", True))
    pdf_files.append(output)
    
    # 3. Placeholder Outline (will be regenerated)
    target = "outline"
    output = BUILD_DIR / "02_outline.pdf"
    if needs_recompile(target, output, cache, hierarchy, args.force):
        targets_to_compile.append((target, output, None, None))
    else:
        print(f"  ✓ Outline (cached)")
    compilation_tasks.append((target, output, "Outline", True))
    pdf_files.append(output)
    
    # 4. Chapters and Pages
    for i, chapter in enumerate(hierarchy):
        first_page = chapter["pages"][0]
        chapter_id = first_page["id"][:2]
        
        # Chapter Cover
        target = f"chapter-{chapter_id}"
        output = BUILD_DIR / f"10_chapter_{chapter_id}_cover.pdf"
        if needs_recompile(target, output, cache, hierarchy, args.force):
            targets_to_compile.append((target, output, None, None))
        else:
            print(f"  ✓ Chapter {chapter_id} cover (cached)")
        compilation_tasks.append((target, output, f"Chapter {chapter_id} cover", False))
        pdf_files.append(output)
        
        # Pages
        for page in chapter["pages"]:
            page_id = page["id"]
            target = page_id
            output = BUILD_DIR / f"20_page_{page_id}.pdf"
            if needs_recompile(target, output, cache, hierarchy, args.force):
                targets_to_compile.append((target, output, None, None))
            else:
                print(f"  ✓ {page_id} (cached)")
            compilation_tasks.append((target, output, page_id, False))
            pdf_files.append(output)
    
    # Compile needed targets in parallel
    if targets_to_compile:
        print(f"\n📦 Compiling {len(targets_to_compile)} changed targets...\n")
        compile_targets_parallel(targets_to_compile, num_jobs=args.jobs)
        
        # Update cache for newly compiled targets
        for target, output, _, _ in targets_to_compile:
            update_cache_entry(cache, target, output, hierarchy)
        save_cache(cache)
    else:
        print("\n✓ All targets up to date (using cache)\n")
    
    # Calculate page counts (need to do this sequentially for page numbering)
    current_page = 1
    page_map = {}
    for target, output, msg, is_special in compilation_tasks:
        page_count = get_pdf_page_count(output)
        if is_special:
            page_map[target] = current_page
            print(f"  {msg}: {page_count} pages (starting at {current_page})")
        else:
            # For chapters and pages
            if "chapter" in target:
                page_map[target] = current_page
                print(f"  {msg}: {page_count} pages (starting at {current_page})")
            else:
                page_map[target] = current_page
                print(f"  {msg}: {page_count} pages (starting at {current_page})")
        current_page += page_count
    
    # Write page map to JSON
    page_map_file = BUILD_DIR / "page_map.json"
    with open(page_map_file, 'w') as f:
        json.dump(page_map, f, indent=2)
    print(f"\n✓ Page map written to {page_map_file}")
    print(f"✓ Total pages: {current_page - 1}\n")
    
    print("\n" + "="*60)
    print("PASS 2: Regenerating TOC and chapters with page numbers")
    print("="*60 + "\n")
    
    # Collect all Pass 2 targets for parallel compilation
    pass2_targets = []
    
    # 5. Regenerate Outline with page numbers
    target = "outline"
    output = BUILD_DIR / "02_outline.pdf"
    pass2_targets.append((target, output, page_map["outline"], page_map))
    
    # 6. Recompile chapters with page offsets
    for i, chapter in enumerate(hierarchy):
        first_page = chapter["pages"][0]
        chapter_id = first_page["id"][:2]
        
        # Chapter Cover with offset
        target = f"chapter-{chapter_id}"
        output = BUILD_DIR / f"10_chapter_{chapter_id}_cover.pdf"
        page_offset = page_map[f"chapter-{chapter_id}"]
        pass2_targets.append((target, output, page_offset, None))
        
        # Pages with offset
        for page in chapter["pages"]:
            page_id = page["id"]
            target = page_id
            output = BUILD_DIR / f"20_page_{page_id}.pdf"
            page_offset = page_map[page_id]
            pass2_targets.append((target, output, page_offset, None))
    
    # Compile all Pass 2 targets in parallel
    print(f"🔢 Recompiling {len(pass2_targets)} sections with page numbers...\n")
    compile_targets_parallel(pass2_targets, num_jobs=args.jobs)
    
    # Update cache for Pass 2 targets
    for target, output, _, _ in pass2_targets:
        update_cache_entry(cache, target, output, hierarchy)
    save_cache(cache)
    
    print(f"\n✓ Pass 2 complete")
    
    # Merge all PDFs
    print("\n" + "="*60)
    print("Merging PDFs")
    print("="*60 + "\n")
    merge_pdfs_with_command(pdf_files, OUTPUT_FILE)
    print(f"✓ Successfully created {OUTPUT_FILE}")
    
    # Cleanup or archive build directory
    if args.leave_individual:
        zip_build_directory(BUILD_DIR)
        print(f"✓ Individual PDFs archived in build_pdfs.zip")
    
    # Always remove build directory
    if BUILD_DIR.exists():
        shutil.rmtree(BUILD_DIR)
        print("✓ Build directory cleaned up")

if __name__ == "__main__":
    main()
