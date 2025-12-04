#import "../../templates/templater.typ":*

The variance that we have learned in middle school is defined as: \ \
$ ("variance")=("average of sqared deviation") $\ // 분산 = 편차의 제곱의 평균
As we have discussed before, in context of probability, we can applicate this like
$ "Var"(X)=E[(X-E(X))sr`] $

#equation()[
  Simplifying the expression above, If $m=E(X)$, 
  $ \V\a\r(X) = sum_x (x-m)^2 p(x) $
  $ = sum_x (x^2 - 2m x + m^2)p(x) $
  $ = sum_x x^2 p(x) - sum_x 2m x p(x) + sum_x m^2 p(x) $
  $ = E(X^2) - 2m^2 + m^2 = E(X^2) - E(X)^2 $
]

#notation("Variance & Standard Deviation")[
  \ $ "Var"(X) = E[(X-E(X))^2] = E(X^2) - E(X)^2 $ \
  $ sigma(X) = sqrt("Var"(X)) $ \
]

#example[
  $X$: the outcome of a dice. $E(X)= 7/2$. Find the variance of $X$. 
  #solution[
    $E(X sr) = sum x sr p(x) \ =1/6(1sr+2sr dots.c + 6 sr) \ = 91/6$
    $ therefore "Var"(X)=E(X sr ) - E(X) sr =91/6-49/4=35/12 $
  ]
]
#example("Squared Means in B(n,p)")[
   From the previous chapter, we know $E(X)=n p$ when $X~B(n,p)$. Now, find $"Var"(X)$ \
   #solution[
     $ E(X sr) = sum^n_(k=0) k sr binom(n,k)p^k (1-p)rd(n-k) $
   ]
 ]