#import "../../templates/templater.typ":*

= Classification of Linear Systems

#definition("Inconsistent Systems")[
  A system is *inconsistent* if it has no solutions (the equations result in a contradiction).

  In the Row Echelon Form (REF), a system is inconsistent if and only if there is a row containing a leading entry (pivot) in the rightmost (augmented/constant) column.

  Mathematically, this looks like a row:
  $ [ 0, 0, ..., 0 bar.v b ] " where " b != 0 $
]

#example("Analyzing Consistency (1)")[
  Consider the following augmented matrix:
  $
    bmat(
      1, 2, 5, 7;
      0, 1, 3, 4;
      0, 0, 0, 1
    )
  $
  Determine if the system is consistent.

  #solution("Analysis", "")[
    The third row corresponds to the equation $0x_1 + 0x_2 + 0x_3 = 1$, or $0 = 1$. \
    Since this is impossible, the system is *inconsistent*.
  ]
]

#example("Analyzing Consistency (2)")[
  Consider the matrix:
  $
    bmat(
      1, 2, 0, 3, 0;
      0, 0, 1, 4, 0;
      0, 0, 0, 1, 0
    )
  $
  Determine if the system is consistent.

  #solution("Analysis", "")[
    - Row 3 is $[0, 0, 0, 1, 0]$. The pivot is in the 4th column (a variable column, $x_4$), not the augmented column.
    - This implies $1 dot x_4 = 0$, which is valid.
    - This system is *consistent*.
  ]
]

#example("Analyzing Consistency (3)")[
  Consider the matrix:
  $
    bmat(
      1, 0, -3, -4, 0;
      0, 1, 0, 0, 5;
      0, 0, 0, 0, 0
    )
  $
  Determine if the system is consistent.

  #solution("Analysis", "")[
    - The third row is all zeros ($0=0$). This is a valid identity and does not cause inconsistency.
    - This system is *consistent*.
  ]
]

= Conditions for Solutions

#note("Unique Solution")[
  A system has a *unique solution* if:
  1. The system is consistent.
  2. There are no free variables.

  This means *every variable column* has a valid leading entry (pivot).
]

#note("Infinitely Many Solutions")[
  A system has *infinitely many solutions* (is dependent) if:
  1. The system is consistent.
  2. There is at least one variable column *without* a leading entry.

  We call the variable corresponding to that column a *"free" variable*, as it can take on any value.
]

#note("Free Variables")[
  $
    bmat(
      1, 2, -3, 1;
      0, 1, 5, -2
    )
  $
  1. Columns 1 and 2 have pivots.
  2. Column 3 ($x_3$) has no pivot. Therefore, $x_3$ is *free*.
  3. Because a free variable exists, there are infinitely many solutions.
]
*In RREF:*
Row reducing fully ($R_1 arrow R_1 - 2R_2$):
$
  bmat(
    1, 0, -13, 5;
    0, 1, 5, -2
  )
$
This allows us to express the pivots in terms of the free variable: $x_1 = 5 + 13x_3$.
