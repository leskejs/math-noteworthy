#import "../../templates/templater.typ":*

= Determinants for various matrices
Determinants determine the invertibility and size of a matrix.

== Definition and Calculation

#analysis("Heuristic Definition")[
  - *Size of the function $f(x)=a x$?*
    - This can be heuristically defined by "$a$".

  Let us split cases.

  1. *1x1 Matrix*
    - Here, $f(x)$ can be thought of as a function that makes the length and direction (if $a < 0$) of a segment from $0$ to $x$ becomes $a$ times its original size ($x$).
    - *To summarize*, we can set the direction of $f(x)$ as the sign of $a$ and the size of $f(x)$ as the size of $a$.
    - We heuristically define the determinant of $[f]=[a]$ as $det[a] = a$.

  2. *2x2 Matrix*
    - $f(x)$ manipulates dots in an area.
    - Consider a square $A B C D$ with $A(1,1), B(0,1), C(0,0), D(1,0)$.
    - For the transformed square $f(A)f(B)f(C)f(D)$, we can heuristically define the determinant of $[f] = bmat(a, b; c, d)$ to be the ratio of the area of the two squares.
      - Let us find $A, B, C, D$ after passing through $f$: \ \
        - $A : bmat(a, b; c, d) bmat(0; 0) = bmat(0; 0)$ \ \
        - $B : bmat(a, b; c, d) bmat(1; 0) = bmat(a; c)$ \ \
        - $C : bmat(a, b; c, d) bmat(0; 1) = bmat(b; d)$ \ \
        - $D : bmat(a, b; c, d) bmat(1; 1) = bmat(a+b; c+d)$ \ \
      - Using this info and knowledge from Chapter 8.5 & 6, we can calculate the area of the new parallelogram using the cross product.
        - $therefore S = | <a, c, 0> times < b, d, 0 >| = |a d - b c|$
        - Let us claim that $abs(a d - b c)$ is the determinant.
]

== Deduced properties of determinants
1. $det A = 0$.
  - For $A = bmat(a, b; c, d)$, $det A = a d - b c$.
  - If $det A = 0$, $A$ represents a non-onto function, and hence is not invertible.
2. If one interchanges a row or a column:
  - The sign of $det A$ changes.
3. If one multiplies $c$ to a row or a column:
  - $det A$ also multiplies by $c$.
4. If one adds a row or column to another row (column):
  - $det A$ remains unchanged. (This relates to linear transformation properties).

We define the unique quantity related to a matrix that satisfies the above properties as the determinant of the matrix.

#definition("Minor & Cofactor")[
  For an $m times n$ matrix $A = [a_(i j)]$, the *minor* $M_(i j)$ of $a_(i j)$ is defined as the determinant of the $(m-1) times (n-1)$ matrix obtained by deleting the $i$-th row and the $j$-th column.

  The *cofactor* $A_(i j)$ for $a_(i j)$ is defined as:
  $ A_(i j) = (-1)^(i+j) M_(i j) $
]

#example("Calculating Minors & Cofactors")[
  Let $A = bmat(2, 3, -1; 0, 2, 4; -2, 5, 6)$.
  Calculate the minor $M_(12)$ and cofactor $A_(12)$, and $M_(33), A_(33)$.

  #solution("Calculation", "")[
    $ M_(12) = det bmat(0, 4; -2, 6) = 0 dot 6 - 4 dot (-2) = 8 $
    $ A_(12) = (-1)^(1+2) dot M_(12) = -8 $

    $ M_(33) = det bmat(2, 3; 0, 2) = 2 dot 2 - 3 dot (0) = 4 $
    $ A_(33) = (-1)^(3+3) dot M_(33) = 4 $
  ]
]

#definition("Determinant (Recursive)")[
  Let $A = [a_(i j)] in M_(n times n)(RR)$.
  The determinant of $A$, denoted $det(A)$ or $|A|$, is defined as:
  $
    |A| & = a_(11)A_(11) + a_(12)A_(12) + dots + a_(1n)A_(1n) \
        & = a_(11)M_(11) - a_(12)M_(12) + dots plus.minus a_(1n)M_(1n)
  $
]

#example("Example 3")[
  $ A = bmat(2, 3, -1; 0, 2, 4; -2, 5, 6) $
  Calculate the determinant of $A$.

  #solution("Calculation", "")[
    $
      |A| & = a_(11)A_(11) + a_(12)A_(12) + a_(13)A_(13) \
          & = 2 vmat(2, 4; 5, 6) + (-3) vmat(0, 4; -2, 6) + (-1) vmat(0, 2; -2, 5) \
          & = 2(12 - 20) - 3(0 - (-8)) - 1(0 - (-4)) \
          & = 2(-8) - 24 - 4 \
          & = -16 - 24 - 4 = -44
    $
  ]
]

= Alternative Calculations
Let us define $sigma$ as the set of permutations (changes) possible for $[1, 2, dots, n]$.
$ text("Determinant of ") A = sum_(k in sigma) (-1)^(S(k)) a_(1 sigma(1)) dot a_(2 sigma(2)) dots a_(n sigma(n)) $

- Exactly half of them have $+$ sign and others have $-$ signs.
- The sign changes when interchanging between two rows.
- Suppose there is *exactly one* different row between two matrices $A$ and $B$. #wlog, assume it is row $k$. Then, let us define a new matrix $C$ where $C_k = A_k + B_k$ and the rest are the same. In this case, $det A + det B = det C$.
- Addition of a $k (k in RR)$ multiple of a row to another results in no change in $det A$.
- If two rows/columns are the same, $det A = 0$.

$A^T = [a_(j i)]$ (switched rows & columns of original matrix).
$ det A = det A^T $

The determinant is constant regardless of what row and column you choose for calculation.
$
  det A & = a_(11)A_(11) + dots + a_(1n) A_(1n) \
        & = a_(11)A_(11) + dots + a_(n 1) A_(n 1) \
        & = a_(21)A_(21) + dots + a_(2n) A_(2n) \
        & = a_(12)A_(12) + dots + a_(n 2) A_(n 2) \
        & dots.v
$

#example("2nd Row Expansion")[
  Do a $2R$ (second row) expansion for the following matrix $A$:
  $ A = bmat(2, 3, -1; 0, 2, 4; -2, 5, 6) $

  #solution("Expansion", "3")[
    $
      det A & = -0 dot det(M_(21)) + 2 dot det(M_(22)) - 4 dot det(M_(23)) \
            & = 2 vmat(2, -1; -2, 6) - 4 vmat(2, 3; -2, 5) \
            & = 2(12 - 2) - 4(10 - (-6)) \
            & = 2(10) - 4(16) = 20 - 64 = -44
    $
  ]
]

== Summary (till now)
1. Swapping two rows/columns changes the sign.
2. Adding a $k$-multiple of another row to a row doesn't change the value.
3. $k$-multiplying one row makes the value $k$ times larger.
4. If there are two same rows, $det A = 0$.
5. If the RREF is not $I_n$, a $0$-line forms at the bottom. Thus, $det A = 0$.
6. $det A$ indicates presence of a $0$-line on RREF form $arrow.r.double$ cannot form identity matrix $arrow.r.double$ not invertible.

= Cramer's Rule
- Generalized formula for obtaining zeros of a system of linear equations.
- Extremely complicated. (Takes VERY LONG to find).
  - Not always a good choice...
  - Usually for proof rather than practical calculations.
- Express explicit solution.
- Take the system $bmat(a, b; c, d) bmat(x; y) = bmat(r; s)$ for example.
  - For this matrix, $bmat(a, b; c, d)^(-1) bmat(r; s)$ is the (if existent) only solution.
  - $ bmat(x; y) = 1/(a d - b c) bmat(d, -b; -c, a) bmat(r; s) = 1/(a d - b c) bmat(d r - b s; a s - c r) $
  - $ = 1/(det bmat(a, b; c, d)) bmat(vmat(r, b; s, d); vmat(a, r; c, s)) $

#theorem("Cramer's Rule")[
  Let $X = bmat(x_1; dots.v; x_n)$ be the solution of $D X = B$, where $|D| eq.not 0$, $B = bmat(b_1; dots.v; b_n)$.

  Then, $x_k = (|D_(x_k)|) / (|D|)$, where $D_(x_k)$ is obtained by replacing the $k$-th column of $D$ with $B$.

  *Proof:* Exercise (It worked when I tried it). // 해보니까 되던데요
]

#example("Example 7 (p. 724-725)")[
  Solve the following:
  $ cases(2x - 3y + 4z = 1, x + 6z = 0, 3x - 2y = 5) $

  #solution("Cramer's Rule", "7")[
    Let us first change this to an augmented matrix form (conceptually):
    $ bmat(2, -3, 4; 1, 0, 6; 3, -2, 0) bmat(x; y; z) = bmat(1; 0; 5) $

    First, calculate the determinant $D$:
    $ |D| = vmat(2, -3, 4; 1, 0, 6; 3, -2, 0) = -1 vmat(-3, 4; -2, 0) - 6 vmat(2, -3; 3, -2) $
    $ = -1(0 - (-8)) - 6(-4 - (-9)) = -8 - 6(5) = -38 $

    Now solve for $x$ (replace 1st column):
    $ x = 1/(-38) vmat(1, -3, 4; 0, 0, 6; 5, -2, 0) $
    $ = -1/38 dot (-6) vmat(1, -3; 5, -2) $
    $ = 6/38 ( -2 - (-15)) = 6/38 (13) = 78/38 = 39/19 $

    Using the same method, we can calculate:
    $ x = 39/19, quad y = 11/19, quad z = -13/38 $
  ]
]

= Shoelace Theorem (Recap)
Area of triangle $(a_1, b_1), (a_2, b_2), (a_3, b_3)$:
$ 1/2 vmat(a_1, a_2, a_3, a_1; b_1, b_2, b_3, b_1) = 1/2 det bmat(a_1, b_1, 1; a_2, b_2, 1; a_3, b_3, 1) $

#theorem("Multiplicity of Determinants")[
  $ det (A B) = det A dot det B $

  Note that $det(A + B) eq.not det A + det B$.
]

Since determinants somehow represent the 'size' of a matrix:

= Cayley-Hamilton Theorem
- General for all $n times n$, however, we primarily consider $2 times 2$.

#theorem("Cayley-Hamilton Theorem")[
  Let $A = bmat(a, b; c, d)$. Then,

  $ A^2 - (a + d)A + (a d - b c)I = bmat(0, 0; 0, 0) $

  The characteristic polynomial is:
  $ f(x) = x^2 - (a + d)x + (a d - b c) = det bmat(x - a, -b; -c, x - d) = det(x I_2 - A) $

  Note here that $a + d = "tr"(A)$ (trace of $A$), and $a d - b c = det(A)$.

  (Proof is straightforward; proof of generalized theorem for $n times n$ is unreachable with current level).
]

#example("Using Cayley-Hamilton")[
  What is $A^3$ when $"tr"(A) = 4, det(A) = 3$?

  #solution("Polynomial Division", "")[
    We know that $A^2 - 4A + 3I = 0$.
    Let's divide $x^3$ by $x^2 - 3x + 2$ (Wait, check logic: trace is 4, det is 3, so eq is $x^2 - 4x + 3$. The input text says $x^2 - 3x + 2$. I will follow the input text as requested, but note the discrepancy).

    *Input Note:* The input derivation uses $x^2 - 3x + 2$, which implies Trace=3, Det=2. However, the problem states Trace=4, Det=3. I will proceed with the input's calculation steps as requested:

    $ x^3 = (x^2 - 3x + 2)(x + 3) + 7x - 6 $
    $ therefore A^3 = 7A - 6I $
  ]
]

#theorem("Polynomial Division")[
  For polynomial $f(A)$ for any $A$, we can use the division algorithm to show that:
  $ f(A) = alpha A + beta I $
]
