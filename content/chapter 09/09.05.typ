#import "../../templates/templater.typ":*

= Recap
- sum in function $f+g arrow.r.double [a_(i j)+b_(i j)]$
- scalar product in function $k f arrow.r.double [k a_(i j)]$
- $f circle.tiny g arrow.r.double [a_(i j)b_(i j)+ dots + a_(i p)b_(p j)]$

= Identity
- What is "identity"?
  - Identity function $arrow.r.double$ a function that doesn't change the value of some function $f$ once the two functions are composed. 
  - The matrix representation of the identity function is the identity matrix. 

#definition("Identity Matrix")[
  The $m times n$ identity matrix $I_n$ is the matrix representation of the identity function $f: RR^n arrow.r.double RR^n, f(x_1, x_2, dots, x_n) = (x_1, x_2, dots, x_n)$.

  In other words, $I_n = bmat(1, 0, 0, 0, dots, 0; 0, 1, 0, 0, dots, 0; 0, 0, 1, 0, dots, 0; dots.v, dots.v, dots.v, dots.v, dots.down, dots.v; 0, 0, 0, 0, dots, 1) = [delta_(i j)]_(n times n)$, where $delta_(i j) = cases(1\, i=j, 0\, i eq.not j)$
]

= Inverse
- The inverse of the operation "matrix multiplication" is not always in presence.
  - The inverse function is not always defined.

#definition("Inverse Matrix")[
  Let us define the inverse matrix of $A$, denoted by $A^(-1)$, is the ($n times n$) matrix satisfying the following: 
  $ A A^(-1) = A^(-1)A = I_n $
]

#note("cf")[
  $A^(-1)$ represents the inverse function of which is represented by $A$. If $A$ does not represent a bijective function, then $A^(-1)$ does not exist. 
]

#analysis("Finding Inverse Matrices of 2x2")[
  Finding Inverse Matrices of $A = bmat(a, b; c, d)$
  
  Let $A^(-1) = bmat(p, q; r, s)$.
  Then, $A A^(-1) = bmat(a, b; c, d) bmat(p, q; r, s) = bmat(a p + b r, a q + b s; c p + d r, c q + d s) = bmat(1, 0; 0, 1)$.
  
  Solving for equations, we have
  $ bmat(p, q; r, s) = 1/(a d - b c) bmat(d, -b; -c, a) space space space space space space (a d - b c eq.not 0) $
  
  Suppose the case where $a d = b c$, or $a:b = c:d$. 
  This means that the matrix is: 
  $ arrow.r.double bmat(a, b; c, d) = bmat(a, k a; c, k c) $
  $ arrow.r.double bmat(a, k a; c, k c) bmat(x; y) = bmat(a(x + k y); b(x + k y)) $
  
  Since $bmat(a, b; c, d)$ is not onto (not iterable), it doesn't have an inverse.
]

#analysis("Finding inverse matrices in general")[
  $ bmat(a_(11), dots, a_(1n); , dots.v, ; a_(n 1), dots, a_(n n)) bmat(x_1; dots.v; x_n) = bmat(b_1; dots.v; b_n) arrow.r.double vec(a_(11)x_1 + dots + a_(1n)x_n = b_1, dots.v, a_(n 1)x_1 + dots + a_(1n)x_n = b_n) $
  
  This equation can be described by the matrix equation $A X = B$. ($A=[a_(i j)]_(n times n), B = bmat(b_1; dots.v; b_n)$)
  
  Let's consider a matrix $A = bmat(a_(11), dots, a_(1n); , dots.v, ; a_(n 1), dots, a_(n n))$ and its inverse $A^(-1) = bmat(b_(11), dots, b_(1n); , dots.v, ; b_(n 1), dots, b_(n n))$
  
  Since two matrices are inverse of each other, we know that $A A^(-1) = bmat(1, dots, 0; dots.v, dots.down, dots.v; 0, dots, 1)$.
  
  Let's think this multiplication as a sequence of matrix equation between $A$ and each column vector of $A^(-1)$. Then, 
  $ bmat(a_(11), dots, a_(1n); , dots.v, ; a_(n 1), dots, a_(n n)) bmat(b_(11); dots.v; b_(n 1)) = bmat(1; dots.v; 0), space dots, space bmat(a_(11), dots, a_(1n); , dots.v, ; a_(n 1), dots, a_(n n)) bmat(b_(1n); dots.v; b_(n n)) = bmat(0; dots.v; 1) $
  
  As we have shown before, each of these matrix equation can be described as a system of equations:
  $ cases(a_(11)b_(11) + dots + a_(1n)b_(n 1) = 1, dots.v, a_(n 1)b_(11) + dots + a_(n n)b_(n 1) = 0), space dots, space cases(a_(11)b_(n 1) + dots + a_(1n)b_(n n) = 0, dots.v, a_(n 1)b_(n 1) + dots + a_(n n)b_(n n) = 1) $
  
  Thus, we can use Gauss-Jordan elimination to 
  $ bmat(a_(11), dots, a_(1n), 1; , dots.v, , dots.v; a_(n 1), dots, a_(n n), 0; augment: #(-1))
  arrow.r.double
  bmat(1, dots, 0, b_(11); dots.v, dots.down, dots.v, dots.v; 0, dots, 1, b_(n 1); augment: #(-1)) $
  to obtain $b_(11), dots, b_(n 1)$ and so on to obtain $A^(-1)$.
  
  It can be easily shown that the application of row operations:
  $ bmat(a_(11), dots, a_(1n), 1, dots, 0; , dots.v, , dots.v, dots.down, dots.v; a_(n 1), dots, a_(n n), 0, dots, 1; augment: #(-3))
  arrow.r.double
  bmat(1, dots, 0, b_(11), dots, b_(1n); dots.v, dots.down, dots.v, , dots.v, ; 0, dots, 1, b_(n 1), dots, b_(n n); augment: #(-3)) $
  is equivalent to what we have shown above.
  
  *Therefore, we can obtain the inverse matrix by using row operations to:*
  $ bmat(a_(11), dots, a_(1n), 1, dots, 0; , dots.v, , dots.v, dots.down, dots.v; a_(n 1), dots, a_(n n), 0, dots, 1; augment: #(-3))
  arrow.r.double
  bmat(1, dots, 0, b_(11), dots, b_(1n); dots.v, dots.down, dots.v, , dots.v, ; 0, dots, 1, b_(n 1), dots, b_(n n); augment: #(-3)) $
  
  In other words, $[A | I] arrow.r.double [I | A^(-1)]$
]

#note("")[Suppose we have a matrix equation $A X = B$. If $A$ has an inverse matrix, then $X = A^(-1)B$ is the unique solution.]