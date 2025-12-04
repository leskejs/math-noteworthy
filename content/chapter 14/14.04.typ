#import "../../templates/templater.typ":*

= Expectation & Variance
- Expectation $approx$ Mean
#notation("Means")[
  - A sane human would calculate the mean like the following : 
  $ M = (x_1 + x_2 + x_3 + dots.c + x_n)/n $
  - However, some insane mathematicians calculate the mean like this : 
  $ M  + (1 times c_1 + 2 times c_2 + dots.c + k times c_k) / n $
  - Here, $c_(1 dots.c k)$ stand for the count for each number, with 
  $ sum_(k=1)^k c_k = n $
  - These means require actual data, so this is a _calculated_ mean.
]
#note("Another means?")[
  Let X be the number of head on 100 times of coin throw. \
  $ X~B(100,1/2) $
  Intuitively, the mean of $X$ is 50. \
  But is this the _same means_ as the one above? \
  This was not calculated by real value.
]
#definition("Expectation")[
  Let $X$ be a discrete random variable, with probability mass function $f$. \ \
  Then, the expectation of $X$ is
  $ E(X) = limits(sum)_x x times f(x) $
]

#notation("Expectiation")[
  $ E(X) = sum_(x in Omega) x times P(X=x) = sum_(x in Omega) x times p(x) $
  - Here, $p(x)$ is the probability mass function, and $Omega$ is the sample space. 
]

#example("Dice will be back")[
  $X=$ the outcome of a dice. Calculate $E(X)$. \
  #solution()[
    Probability mass function of $X$ is:
    $ p(x)=P(X=x)=1/6, " " x=1,2,3,4,5,6 $
    $ E(X) = limits(sum)_x x times p(x) = 1 dot 1/6 + 2 dot 1/6 + dots.c + 6 dot 1/6 = 7/2 $
  ]
]

#equation[
  $X~B(n,p)$ \
  Guess: $E(X)=n p$
  $ E(X) = sum_(k=0)^n k (X=k) $
  $ = sum_(k=1)^n n!/((k-1)!(n-k)!) p^k (1-p) ^ k $
  $ = sum_(k=1)^n (n (n-1)!)/((k-1)!(n-k)!) p^k (1-p)^k $
  $ = n sum_(k=1)^n binom(x-1,k-1)P rd(k)(1-p)^(x-k) $
  let $j=k-1$
  $ = n sum_(j=0)^(n-1) binom(n-1,j)p rd(j+1) (1-p)rd(n-1-j) $
  $ = n p sum_(j=0)^(n-1) binom(n-1,j)p^j(1-p)^(n-1-j) $
  $ = n p $
  $ therefore "If" X ~ B(n,p)", then "E(X)=n p $
]

#note("The expected value of functions using random variables")[
  In general, to find the expected value of $f(X)$ where $X$ is the random variable, we can do : 
  $ E(f(X)) = sum_x f(x) times p(x) $
]

#note("The linear decomposition of random variables")[
  $ E(a+b X) = sum_x (a+b x )p(x) $
  $ = a sum_x p(x) + b sum _x x p(x) = a+b E(x) $
  Similarly,
  $ E(X+Y)=E(X)+E(Y) $
  However,
  $ E(X Y) eq.not E(X)E(Y) $
] 
