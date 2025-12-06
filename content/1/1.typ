#import "../../templates/templater.typ":*

= Matrix
== What is a matrix?
A $m times n$ matrix is a rectangular array of numbers with $m$ rows and $n$ columns.

$
  bmat(
    a_(11), a_(12), dots, a_(1n);
    a_(21), a_(22), dots, a_(2n);
    a_(31), a_(32), dots, a_(3n);
    a_(41), a_(42), dots, a_(4n);
    dots.v, dots.v, , dots.v;
    a_(m 1), a_(m 2), dots, a_(m n)
  ) = [a_(i j)]_(m times n)
$

// Utilizing the new Analysis block
#analysis("Matrix Components")[
  - *Dimensions*: $m times n$
  - *Entries*: $a_(i j)$ (the entry in the $i$-th row and $j$-th column)
]

= Augmented Matrix
== Representation of Linear Systems
The matrix $[a_(i j)]_(m times n)$ signifies $m$ equations and $n$ variables. Thus, we can use it to describe a system of equations such as:

$
  cases(
    a_(11)x_(1) + a_(12)x_(2) + dots + a_(1n)x_(n) = b_(1),
    a_(21)x_(1) + a_(22)x_(2) + dots + a_(2n)x_(n) = b_(2),
    a_(31)x_(3) + a_(32)x_(2) + dots + a_(3n)x_(n) = b_(3),
    dots.v,
    a_(m 1)x_(1) + a_(m 2)x_(2) + dots + a_(m n)x_(n) = b_(m)
  )
$

This can be represented by the augmented matrix:

$
  bmat(
    a_(11), a_(12), dots, a_(1n), b_1;
    a_(21), a_(22), dots, a_(2n), b_2;
    a_(31), a_(32), dots, a_(3n), b_3;
    a_(41), a_(42), dots, a_(4n), b_4;
    dots.v, dots.v, , dots.v, dots.v;
    a_(m 1), a_(m 2), dots, a_(m n), b_m
  )
$

#note("System to Matrix")[
  $ cases(6x - 2y - z = 4, x + 3z = 1, 7y + z = 5) arrow.r.double bmat(6, -2, -1, 4; 1, 0, 3, 1; 0, 7, 1, 5) $
]

= Elementary Row Operations

#definition("Elementary Row Operations (EROs)")[
  Let us define *Elementary Row Operations (EROs)* as operations performed on a matrix that do not change the solution set of the corresponding linear system. There are three types:

  1. Add a multiple of one row to another.
  2. Multiply a row by a non-zero scalar.
  3. Interchange two rows.
]

#example("Row Operations (pg. 687)")[
  Consider the system:
  $ cases(x - y + 3z = 4, x + 2y - 2z = 10, 3x - y + 5z = 14) $
  Perform row operations to reach Row-Echelon Form.

  #solution("Row Operations", "")[
    Represented as an augmented matrix:

    $ bmat(1, -1, 3, 4; 1, 2, -2, 10; 3, -1, 5, 14) $

    *Step 1:* Eliminate $x$ from rows 2 and 3.
    $
      bmat(1, -1, 3, 4; 1, 2, -2, 10; 3, -1, 5, 14) arrow.r.long^(R_(2)-R_(1) -> R_(2))_(R_(3)-3R_(1) -> R_(3)) bmat(1, -1, 3, 4; 0, 3, -5, 6; 0, 2, -4, 2)
    $

    *Step 2:* Simplify and eliminate further to reach REF.
    $
      bmat(1, -1, 3, 4; 0, 3, -5, 6; 0, 2, -4, 2) arrow.r.long^(R_(2) - 3R_(3) -> R_(2))_(R_2 <-> 1/2 R_3) bmat(1, -1, 3, 4; 0, 1, -2, 1; 0, 0, 1, 3)
    $

    We call this final form the *Row-Echelon Form (REF)*:
    $
      bmat(
        1, a_(12), a_(13), dots, a_(1n), b_1;
        0, 1, a_(23), dots, a_(2n), b_2;
        0, 0, 1, dots, a_(3n), b_3;
        0, 0, 0, dots, a_(4n), b_4;
        dots.v, dots.v, dots.v, , dots.v, dots.v;
        0, 0, 0, dots, 1, b_m
      )
    $

    Using back-substitution or further elimination, we can reach the *Reduced Row-Echelon Form (RREF)*:
    $
      bmat(
        1, 0, 0, dots, 0, b_1;
        0, 1, 0, dots, 0, b_2;
        0, 0, 1, dots, 0, b_3;
        0, 0, 0, dots, 0, b_4;
        dots.v, dots.v, dots.v, , dots.v, dots.v;
        0, 0, 0, dots, 1, b_m
      )
    $
  ]
]

== Row-Echelon Form & Reduced Row-Echelon Form

#definition("REF & RREF")[
  A *row-echelon form (REF)* is a matrix satisfying three properties:
  1. The first non-zero entry of a row is always 1 (the *leading entry*).
  2. Leading entries in each row are to the right of the leading entries in the rows above.
  3. All rows consisting entirely of zeros are at the bottom.

  *Example of REF:*
  $ bmat(1, 0, 0, 0, 2; 0, 1, 0, 0, 3; 0, 0, 0, 1, 4) $

  If a matrix is in REF and satisfies the additional condition:
  4. All entries *above* each leading entry are also zero.

  It is called a *reduced row-echelon form (RREF)*.
]

#example("Solving Systems (pg. 689)")[
  Solve the system given by the augmented matrix:
  $ bmat(4, 8, -4, 4; 3, 8, 5, -11; -2, 1, 12, -17) $

  #solution("RREF Method", "3")[
    By applying Gaussian Elimination until we reach RREF, we obtain:
    $ bmat(1, 0, 0, -3; 0, 1, 0, 1; 0, 0, 1, 2) $

    Converting back to equations:
    $ (x,y,z) = (-3,1,2) $
  ]
]

#analysis("General Strategy")[
  1. *Gaussian Elimination:* Manipulate the leftmost non-zero column to create a leading entry (1), then eliminate entries below it. Repeat for subsequent rows to obtain *REF*.
  2. *Gauss-Jordan Elimination:* Continue eliminating entries *above* the leading entries to obtain *RREF*.
]

= Summary of Methods
- *Gaussian Elimination*: Strategy to obtain REF (requires back-substitution to solve).
- *Gauss-Jordan Elimination*: Strategy to obtain RREF (solution is read directly).
