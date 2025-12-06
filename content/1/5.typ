#import "../../templates/templater.typ":*

= Partial Fraction Decomposition
- The opposite of finding the common denominator.
  - $5/6 arrow.l.r 1/2 + 1/3$
- Denominator must have a larger degree than the numerator.
  - Thus, the fractional part of the number must be $< 1$.
  - Otherwise, use division to separate quotient and remainder.
    - $1/x + 1/(x-1) = (2x-1)/(x sr - x)$


= Steps for Partial Fraction Decomposition
- Factorize the denominator
#example("Excercise 1")[
  Compute the partial  decomposition of $(5x + 7)/(x cb + 2x sr - x - 2)$
  #solution("Find Numerator", 1)[
    First, factorize the denominator. $(x cb + 2x sr - x - 2) = (x+2)(x+1)(x-1)$
    $ (5x+7)/(x cb + 2x sr - x - 2)=1/(x+2) + b/(x + 1) + c(x-1) $
    $ arrow.r.double a(x+1)(x-1) + b(x+2)(x-1)+c(x+2)(x+1)=5x+7 $
    Plug in $x=-2->3a=-3 arrow.r.double a=-1$ \
    Plug in $x=-1->-2b=2 arrow.r.double b=-1$ \
    Plug in $x=-2->6a=23 arrow.r.double c=2$
    $ therefore (5x+7)/(x cb + 2x sr - x -2)=-1/(x+2) + (-1)/(x+1) + 2/(x-1) $
  ]
]

== What If There is Repeated Terms?
#example("Exercise 2")[
  Compute the partial fraction decomposition of $(x sr + 1)/(x(x-1) cb )$
  \ \
  Shall we set $a/x+(p x sr + q x + r)/((x-1) cb)$ ?\
  This seems a bit too messy.\
  #solution("Clever Way", 1)[
    $ (x sr + 1)/(x(x-1) cb )=1/x+b/(x-1)+c/((x-1) sr )+d/((x-1)cb) $
    $ arrow.r.double x sr + 1 = a(x-1) cb + x{b(x-1) sr + c(x-1) + d} $
    Plug in $x=1 arrow.r.double d=2$\
    Plug in $x=0 arrow.r.double a=-1$\
    $ x sr + 1 = -(x-1) cb + x {b(x-1)sr +c(x-1) + 2} $
    In this case, it is impossible to find other coefficients besides $a,d$ can't be found by simply substituting $x$.
    \ \
    Substract both sides by all terms without variables $a,b,c$
    $ x cb - 2x sr + x = x(b(x-1) sr + c(x-1)) $
    $ arrow.r.double x(x-1)sr=x(b(x-1)sr+c(x-1)) $
    $ x-1=b(x-1)+c $
    $ therefore b=1,c=0 $
  ]
]
#proof("Splitting powers")[
  Let the subject of partial fraction decomposition be
  $
    p(x)/((a_1 x + b_1) rd(r_1)+ (a_2 x + b_2) rd(r_2) + dots.c + (a_n x + b_n) rd(r_n))"  "(deg p < (r_1 + r_2 + dots.c + r_n))
  $
  $
    = c_1/(a_1x+b_1)+ (c_2/(a_1x+b_1))^2 + + " "dots.c + (c_n/(a_1x+b_1))^(r_1) \
    + c_(r_1+1)/(a_2x+b_2)+ (c_(r_1+1)/(a_2x+b_2))^2 + + " "dots.c + (c_(r_1+r_2)/(a_2x+b_2))^(r_2) \
    dots.v \
    + c_(r_1+r_2+dots.c+r_(n-1)+1)/(a_n x+b_n)+ (c_(r_1+r_2+dots.c+r_(n-1)+2)/(a_n x+b_n))^2 + + " "dots.c + (c_(r_1+r_2+dots.c+r_(n))/(a_n x+b_n))^(r_n)
  $
]

