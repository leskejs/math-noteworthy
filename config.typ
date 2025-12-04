//Hello user! If you are looking at this file,
//you are at the place where you can configurate
//your theme. To view the full document, go and
//look at ./templates/parser.typ!
//if you have any problesm writing with math, take this website for reference :
//https://tug.ctan.org/info/typstfun/typstfun.pdf
//
//=================
//document settings
//=================

#let title = "Mathematics II"
#let subtitle = "Class Notes, Example Problems"
#let authors = ("Lee Sihoo", "Lee Hojun")
#let affiliation = "Korea Science Academy of KAIST"
#let logo = "../../content/images/cover-logo.png" //Write from view of /template/covers/~.typ
#let show-solution = true
#let solutions-text = "Answers ver."
#let problems-text = "Problems ver."
#let chapter-name = "Chapter"
#let subchap-name = "Article"



//=======
//display
//=======
#let font = "IBM Plex Serif"
#let title-font = "Noto Sans Adlam"
#let display-cover = true
#let display-outline = true
#let display-chap-cover = true
#let box-margin = 5pt
#let box-inset = 15pt

//=================
//rendering quality
//=================
#let draft-mode = false

// Plot samples: linear memory (O(n))
#let render-sample-count = if draft-mode { 500 } else { 5000 }

// Implicit plot samples: quadratic memory (O(n²))
// Note: 400 samples = 160K points, 2000 samples = 4M points
#let render-implicit-samples = if draft-mode {
  200
} else {
  2000
}

#let display-mode = "rose-pine" //lower / upper case is ignored
#import "./templates/default-schemes.typ": * //loads default schemes
#let colorschemes = (
  dark: scheme-dark,
  light: scheme-light,
  print: scheme-print,
  rose-pine: scheme-rose-pine,
  nord: scheme-nord,
  dracula: scheme-dracula,
  gruvbox: scheme-gruvbox,
  catppuccin-mocha: scheme-catppuccin-mocha,
  catppuccin-latte: scheme-catppuccin-latte,
  solarized-dark: scheme-solarized-dark,
  solarized-light: scheme-solarized-light,
  tokyo-night: scheme-tokyo-night,
  everforest: scheme-everforest,
  moonlight: scheme-moonlight,
  //define more custom schemes here!
)
#let active-theme = colorschemes.at(lower(display-mode), default: scheme-dark)


//========================================================================
//content hierarchy
//Beware that if the IDs are defined wrong, they will result in an error.
//========================================================================

#let preface-content = [
  Welcome to *Mathematics II*, a comprehensive exploration of advanced mathematical concepts that will expand your understanding of how mathematics describes and analyzes the world around us.

  #v(1.5em)

  = About This Textbook

  #v(0.5em)

  This textbook has been thoughtfully designed to guide you through four fundamental areas of advanced mathematics:

  #v(0.5em)

  *Polar Coordinates, Parametric Equations, and Vectors* — Moving beyond the rectangular coordinate system to explore dynamic representations of position, motion, and force in multi-dimensional space.

  #v(0.3em)

  *Matrices* — Discovering powerful tools for organizing data, solving linear systems, and transforming geometric space through elegant algebraic operations.

  #v(0.3em)

  *Conic Sections* — Investigating the beautiful curves that emerge from intersecting planes with cones, revealing the geometric patterns that govern planetary orbits and architectural designs.

  #v(0.3em)

  *Probability and Statistics* — Transitioning from deterministic mathematics to the realm of uncertainty, developing tools to quantify chance and extract meaning from complex datasets.

  #v(1.5em)

  = How to Use This Book

  #v(0.5em)

  This textbook follows a structured learning approach designed to build deep understanding. You will encounter various block types throughout:

  #v(0.5em)


  #text(weight: "bold", fill: active-theme.blocks.definition.stroke)[Definition blocks] introduce key concepts and terminology with precise mathematical language.

  #text(weight: "bold", fill: active-theme.blocks.example.stroke)[Example blocks] present problems that illustrate the application of concepts, followed by detailed step-by-step solutions.

  #text(weight: "bold", fill: active-theme.blocks.solution.stroke)[Solution blocks] provide complete, worked-out answers with clear reasoning at each step.

  #text(weight: "bold", fill: active-theme.blocks.theorem.stroke)[Theorem blocks] state important mathematical results that you can rely upon in your work.

  #text(weight: "bold", fill: active-theme.blocks.proof.stroke)[Proof blocks] demonstrate the logical reasoning behind theorems, helping you understand why results are true.

  #text(weight: "bold", fill: active-theme.blocks.note.stroke)[Note blocks] offer helpful insights, common pitfalls to avoid, and connections between ideas.


  #v(1em)

  = A Note on Learning

  #v(0.5em)

  Mathematics is not a spectator sport. While reading through definitions and examples is important, true understanding comes from _active engagement_. We encourage you to:

  #v(0.3em)

  - Work through each example _before_ looking at the solution
  - Try to understand _why_ each step follows from the previous one
  - Connect new concepts to what you already know
  - Practice additional problems to reinforce your understanding
  - Ask questions to your instructor when something is unclear

  #v(0.5em)

  The solutions provided are detailed and show the complete thought process, but they should serve as a guide and verification tool, not a substitute for your own problem-solving efforts.


  = Looking Ahead

  #v(0.8em)

  The mathematics you encounter in this course is not merely _abstract theory_—it forms the foundation for advanced work in _physics_, _engineering_, _computer science_, _economics_, and countless other fields. From the elliptical orbits of satellites to the encryption protecting digital communications, from statistical analysis of scientific data to the rendering of 3D computer graphics, these mathematical tools are actively shaping our modern world.

  #v(0.5em)

  We hope this textbook serves as both a rigorous introduction to these powerful ideas and an invitation to see mathematics as a lens through which to understand the elegant patterns underlying our universe.
]

#let hierarchy = (
  (
    title: "Polar Coordinates, Parametric Equations & Vectors",
    summary: "Until now, our study of functions has been confined to the static grid of the Rectangular coordinate system. However, the dynamic physical universe—filled with spiraling galaxies and directional forces—rarely conforms to such rigid constraints. In this chapter, we expand our mathematical lexicon to include Polar Coordinates, Parametric Equations, and Vectors, freeing us from the limitations of Cartesian graphs. By redefining position through distance and angle and introducing time as a driving parameter, we gain the sophisticated framework necessary to analyze motion, force, and form in a complex, multi-dimensional world.",
    pages: (
      (id: "08.01", title: "Polar Coordinates"),
      (id: "08.02", title: "Graphs of Polar Equations"),
      (id: "08.03", title: "Polar Form of Complex Numbers; De Moivre's Theorem"),
      (id: "08.04", title: "Plane Curves and Parametric Equations"),
      (id: "08.05", title: "Vectors"),
      (id: "08.06", title: "The Dot & Cross Product"),
      (id: "08.07", title: "Equations of Lines Planes"),
    ),
  ),
  (
    title: "Matrices",
    summary: "While elementary algebra focuses on individual numbers representing single quantities, modern mathematics often requires us to manage and manipulate vast structures of data simultaneously. This brings us to the study of Matrices—rectangular arrays of numbers that serve as one of the most powerful tools in the mathematical arsenal. In this chapter, we will evolve our understanding of linear systems, moving from simple substitution to the elegant efficiency of Gaussian elimination and matrix operations. Beyond merely solving equations, we will discover that matrices act as functional operators capable of transforming space—rotating, scaling, and shearing geometric figures. Whether it is rendering 3D computer graphics, modeling economic input-output systems, or encrypting digital communications, the logic of matrix algebra provides the fundamental framework for organizing and processing information in the digital age.",
    pages: (
      (id: "09.01", title: "Systems of Linear Equations"),
      (id: "09.03", title: "Matrices and Systems of Linear Equations"),
      (id: "09.04", title: "The Algebra of Matrices"),
      (id: "09.05", title: "Inverse Matrices & Matrix Equations"),
      (id: "09.06", title: "Determinants & Cramer's Rule"),
      (id: "09.07", title: "Partial Fractions"),
      (id: "09.09", title: "Systems of Inequalities & Linear Programming"),
    ),
  ),
  (
    title: "Conics",
    summary: "Geometric shapes are often defined by rigid distances and angles, but few families of curves possess the elegance and universal utility of Conic Sections. Derived from the intersection of a plane and a double-napped cone, these four distinct curves—the circle, ellipse, parabola, and hyperbola—serve as the architectural blueprints of the universe. In this chapter, we will explore the dual nature of conics, examining them both as geometric loci defined by focal points and directrices, and as algebraic solutions to quadratic equations in two variables. From the elliptical orbits of planets governing our solar system to the parabolic curves used in satellite dishes and suspension bridges, mastering conics reveals the profound mathematical harmony connecting abstract algebra with the physical laws of nature.",
    pages: (
      (id: "10.01", title: "Parabolae"),
      (id: "10.02", title: "Ellipses"),
      (id: "10.03", title: "Hyperbolae"),
      (id: "10.04", title: "Shifted Conics"),
      (id: "10.05", title: "Rotation of Axes"),
      (id: "10.06", title: "Polar Equations of Conics"),
    ),
  ),
  (
    title: "Probabilities & Statistics",
    summary: "In our exploration of mathematical models thus far, we have primarily dealt with deterministic systems—where a given input inevitably yields a specific, calculated output. However, the world we inhabit is rarely so predictable; it is governed by uncertainty, variability, and chance. This chapter transitions us from the absolute certainty of algebraic functions to the stochastic nature of Probability and Statistics. Here, we will develop the analytical tools necessary to quantify uncertainty, calculate the likelihood of future events, and interpret complex datasets to uncover hidden patterns. By mastering concepts such as combinatorics, probability distributions, and statistical analysis, we bridge the gap between theoretical mathematics and practical application, empowering us to make data-driven decisions in fields ranging from quantum mechanics and engineering to economics and social policy.",
    pages: (
      (id: "14.01", title: "Counting"),
      (id: "14.02", title: "Probability"),
      (id: "14.03", title: "Binomial Probability"),
      (id: "14.04", title: "Expected Value"),
      (id: "14.05", title: "Variance & Deviance"),
      (id: "14.06", title: "Statistics"),
    ),
  ),
)

//


//=========================
//define your snippets here
//=========================

#let st = [such that]
#let wlog = [without loss of generality]
#let qed = [$therefore$ Q.E.D.]
#let sht = [show that]
#let Sht = [Show that]

#let sr = $attach(, t: 2)$
#let cb = $attach(, t: 3)$
#let sq(k) = $sqrt(#k)$
#let rd(body) = $attach(, t: body)$
#let invs = $attach(, t: -1)$
#let comp = $attach(, t: c)$
#let xy = $x y$

#let bmat(..cols) = $mat(..cols, delim: "[")$
#let Bmat(..cols) = $mat(..cols, delim: "{")$
#let vmat(..cols) = $mat(..cols, delim: "|")$
#let Vmat(..cols) = $mat(..cols, delim: "||")$
#let bmat(..cols) = $mat(..cols, delim: "[")$
