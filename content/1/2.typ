#import "../../templates/templater.typ":*

= Linear Transform (tr. 1차 변환)
- Also known as a *linear function* (tr. 1차 함수).
- *Narrow definition of a linear function:*
  - $y = a x$ (No constant term).
  - Only first degree variables.
  - Example of a system:
    $ cases(x - y + z = 1, x + y + z = 3, x + y - z = 1) arrow.r.double bmat(1, -1, 1, 1; 1, 1, 1, 3; 1, 1, -1, 1) $

#analysis("Solving System of Equations")[
  Let us think of a function $f : RR^3 -> RR^3$. We can use $f$ as the function that performs the following mapping:
  $ f(bmat(x; y; z)) = bmat(x - y + z; x + y + z; x + y - z) $
  
  Here, solving the system means looking for a specific solution where:
  $ f(bmat(x; y; z)) = bmat(1; 3; 1) $
]

- Let $M_(m times n)(RR)$ be the set of all $m times n$ matrices with real entries. 
- For clarity, we will treat the following notations as equivalent:
  $ therefore bmat(x; y; z) equiv (x, y, z) equiv chevron.l x, y, z chevron.r $

#definition("Linear Function")[
  A function $f: RR^n -> RR^m$ is *linear* if:
  $ f(vec(x) + vec(y)) = f(vec(x)) + f(vec(y)) \
    f(a vec(x)) = a f(vec(x)) $
  for all $vec(x), vec(y) in RR^n$ and $a in RR$.
]

// UPDATED: Uses #theorem block
#theorem("Theorem 9.2")[
  Let $f: RR^n -> RR^m$ be a linear function (transform). \
  Then, there $exists$ a unique $A in M_(m times n)(RR)$ #st for all $vec(x) in RR^n$, we have:
  
  $ f(vec(x)) = A vec(x) = bmat(
    a_(11)x_(1) + a_(12)x_(2) + dots + a_(1n)x_(n);
    a_(21)x_(1) + a_(22)x_(2) + dots + a_(2n)x_(n);
    dots.v;
    a_(m 1)x_(1) + a_(m 2)x_(2) + dots + a_(m n)x_(n)
  ) $
]

#proof("Theorem 9.2", [
  *Claim:*
  Let $vec(e)_i$ be the $i$-th standard unit vector of $RR^n$.
  Let $vec(x) = x_1 vec(e)_1 + x_2 vec(e)_2 + dots + x_n vec(e)_n$.
  We can describe $f(vec(x))$ as:
  $ f(vec(x)) = f(x_1 vec(e)_1 + x_2 vec(e)_2 + dots + x_n vec(e)_n) $

  Since $f(vec(x))$ is a linear function, we can divide this into its terms:
  $ f(vec(x)) = f(x_1 vec(e)_1) + f(x_2 vec(e)_2) + dots + f(x_n vec(e)_n) $

  Again, due to linearity (homogeneity), we can extract the coefficients:
  $ = x_1 f(vec(e)_1) + x_2 f(vec(e)_2) + dots + x_n f(vec(e)_n) $

  If we define the standard unit vectors of $RR^m$ as $vec(v)_i$, we can represent $f(vec(e)_j)$ in the following form:
  $ text("Let ") f(vec(e)_j) = a_(1j)vec(v)_1 + a_(2j)vec(v)_2 + dots + a_(m j)vec(v)_m $

  By combining these equations, we get:
  $ f(vec(x)) = sum_(j=1)^n x_j f(vec(e)_j) = sum_(j=1)^n x_j (a_(1j)vec(v)_1 + a_(2j)vec(v)_2 + dots + a_(m j)vec(v)_m) $
  
  Rearranging terms by the basis vectors $vec(v)_i$:
  $ = (sum_(j=1)^n a_(1j)x_j) vec(v)_1 + (sum_(j=1)^n a_(2j)x_j) vec(v)_2 + dots + (sum_(j=1)^n a_(m j)x_j) vec(v)_m $

  $ = bmat(
    a_(11)x_(1) + a_(12)x_(2) + dots + a_(1n)x_(n);
    a_(21)x_(1) + a_(22)x_(2) + dots + a_(2n)x_(n);
    dots.v;
    a_(m 1)x_(1) + a_(m 2)x_(2) + dots + a_(m n)x_(n)
  ) $
])

#note("Matrix Representation")[
  The linear transform $f: RR^n -> RR^m$ corresponds to a matrix $A in M_(m times n)(RR)$. \
  $A = [f]$ is called the *matrix representation* of $f$.
]

#example("Example 9.3")[
  Let $T: RR^n -> RR$, $T(vec(x)) = vec(v) dot vec(x)$, where $vec(v) = chevron.l v_1, v_2, dots, v_n chevron.r$ is a fixed vector.
  Determine if $T$ is linear.

  #solution("Dot Product Linearity", "9.3")[
    $T$ is linear:
    $ T(vec(x) + vec(y)) &= vec(v) dot (vec(x) + vec(y)) \
    &= vec(v) dot vec(x) + vec(v) dot vec(y) \
    &= T(vec(x)) + T(vec(y)) $
    
    Also,
    $ T(a vec(x)) &= vec(v) dot (a vec(x)) \
    &= a(vec(v) dot vec(x)) \
    &= a T(vec(x)) $
    #qed
  ]
]

#example("Example 9.4")[
  Let $vec(v) = bmat(1; 2; -2)$ and $T: RR^3 -> RR^3$ be defined by $T(vec(x)) = "proj"_(vec(v)) vec(x)$.
  Find the matrix representation of $T$.

  #solution("Projection Matrix", "9.4")[
    $ T(vec(x)) = (vec(v) dot vec(x)) / (norm(vec(v))^2) vec(v) $
    
    First, calculate the scalar factor:
    $ (1/9 chevron.l 1, 2, -2 chevron.r dot chevron.l x, y, z chevron.r) bmat(1; 2; -2) 
    = (x/9 + 2/9 y - 2/9 z) bmat(1; 2; -2) $
    
    Distributing this scalar to the vector:
    $ = bmat(
      1/9 x + 2/9 y - 2/9 z;
      2/9 x + 4/9 y - 4/9 z;
      -2/9 x - 4/9 y + 4/9 z
    ) $
    
    Therefore, the matrix representation is:
    $ [T] = bmat(
      1/9, 2/9, -2/9;
      2/9, 4/9, -4/9;
      -2/9, -4/9, 4/9
    ) $
  ]
]

// UPDATED: Uses #theorem block
#theorem("Theorem 9.5")[
  Let $f: RR^m -> RR^n$, $g: RR^m -> RR^n$, and $h: RR^p -> RR^m$ be linear functions with matrix representations:
  $ [f] = A in M_(m times n)(RR), quad [g] = B in M_(m times n)(RR), quad [h] = C in M_(p times m)(RR) $
  
  Then:
  1. $f + g$ is linear.
  2. $k f$ is linear.
  3. $f circle g$ is linear.
  
  Corresponding matrix operations:
  - $[f + g] = [a_(i j) + b_(i j)]_(n times m)$
  - $[k f] = [k a_(i j)]_(n times m)$
  - $[f circle h] = [S_(i j)]_(n times p)$, where $S_(i j) = sum_(k=1)^m a_(i k) c_(k j)$ (dot product of $i$-th row of $A$ and $j$-th column of $C$).
]

= Matrix Operations

#definition("Addition & Scalar Multiplication")[
  Let $A, B in M_(n times m)(RR)$ and $k in RR$.
  
  *Addition:*
  $ A + B = [a_(i j) + b_(i j)]_(n times m) $
  
  *Scalar Multiplication:*
  $ k A = [k a_(i j)]_(n times m) $
  
  (This is fundamentally the same as vector operations).
]

#definition("Matrix Multiplication")[
  Let $A in M_(n times m)$ and $C in M_(m times p)$.
  The multiplication $A C$ is defined as:
  
  $ A C = [S_(i j)]_(n times p) $
  
  where $S_(i j) = sum_(k=1)^m a_(i k) c_(k j) = text("(dot product of the " i "-th row of " A " and the " j "-th column of " C ")") $
]

#analysis("Properties of Matrix Operations")[
  - *Associative property of addition:* $(A + B) + C = A + (B + C)$
  - *Commutative property of addition:* $A + B = B + A$
  - *Scalar distributive property:* $k(A + B) = k A + k B$
  - *Associative property of multiplication:* $(A B) C = A (B C)$
  - *Non-commutative property of multiplication:* $A B eq.not B A$
  - *Left-distributive property:* $A(B + C) = A B + A C$
  - *Right-distributive property:* $(A + B) C = A C + B C$
]