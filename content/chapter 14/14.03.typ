#import "../../templates/templater.typ": *

= Random Variable

#definition("Random Variable(tr. 확률 변수)")[
  A *Random Variable* is the variable that the value changes.
  - Due to probabilistic uncertainty, we cannot estimate the variable's number
  - After the uncertainty has disappeared (after element of $S$ has been selected), we can know its value.
  - In the end, the random variable is a *function* that takes a sample space as the domain.
]

#notation([Variables])[
  (Variables) : $x, y, z$
  (Random Variables) : $X(s), Y(s), Z(s)$ where $s in S.S$
  - Capitalize to empathize that it is random(...)
]

- We can use random variable to express events:
  - ${s in S | X(s) = 8}$ : Event (subset of $S$) where the element of $S$ is 8

#notation("Event")[
  $ {s in S | X(s) = 8} = {X=8} $
  $ {s in S | X(s) > 0} = {X>0} $
  $ {s in S | 1 <= X(s) <= 3} = {1 <= X <= 3} $
]

#example("Two dice toss")[
  Find the probability of sum of two dice being 8
  #solution("", 1)[
    $S = [6] times [6]$ \
    $X(i,j)=i+j$ \
    ${X=8}={(2.6),(3,5),(4,4),(5,3),(6,2)}$ \
    $arrow.r.double P{X=8}=5/36$
  ]
]

#note("A closed thermodynamic system")[
  In a thermodynamic system, where the variables $T(s), P(s) ,V(s)$ are defined by physics, These variables are random variables. Here, the sample space is the set of all thermodynamical states. \
  In this case, we can't simply find ${T(s)=293K}$ because sample set have continuous, infinite elements; making it 0.
]

#note("Discrete & Continuous Random Variables")[
  A *discrete random variable* is a variable that only takes discrete values as input. For instance, a random variable with the sample space ${8,9,10}$ is a discrete random variable.

  However, in a continuous region, we cannot easily say that P(some value) will be some number. It will be close to 0. Instead, for *continuous random variables*, we define a region to view its probability. For instance, a random variable with the sample space ${x | x in [8,10]}$ where $x in RR$. We use a *probability mass function* to find its probability in a region.
]

#definition("Probability mass function")[
  Let $X$ be a discrete random variable. \
  Then, the *probability mass function (p.m.f)* is defined as
  $ p(a)=P[X=a] $
]

#note("Extra")[
  The deliminator around $X=a$ (e.g. ${X=a}$, $(X=a)$, $[X=a]$)
  doesn't really matter.
]

#note("Remark")[
  $p(a)=0$ for $a$, except for the values that $X$ can take, \
  Domain of $p$: $[0,1]$, $limits(sum)_a = 1$ is the criteria of being valid probability mass function.
]

= Binomial Random Variables
#definition("Binomial Random Variables")[
  A *binomial random variable* is the number of successes among _repeated independent experiments_ of $n$ times each experiment has two outcomes "success" and "fail".
]
#notation("Binomial Random Variables")[
  A binomial random variable has two parameters
  - $n$ : number of repeated experiments
  - $p$ : (the probability of "success" of each experiment)
  We write $X$ : a binomial random variable with parameters $n$, $p$.
  To simplify, we write
  $ X ~ B(n,p) $
]


#note("")[
  If $X~B(n,p)$, $Y~B(n,p)$,
  their p.m.f. are same. \
  However, $X=Y$ is not necessary. \ Beware that even if the probability functions are the same, the actual random variables may not.
]

= Probability Mass Functions of Binomial Random Variables
Let $X~B(n,p)$,
$ underbrace(P(X=k), "k success\nin n") = cases(binom(n, k) p rd(k) (1-p)rd(k) ", k= 0,...,n", , 0", otherwise.") $


#example("dice dice dice")[
  $X$: the number of outcomes $>= 5$, among 7 dice tosses.
  Find the probability mass function.
  #solution("", 1)[
    $ X~B(underbrace(7, "trials"), underbrace(1/3, "   probability\nof having 5,4,6")) $

    Count for $X$ to be satisfied $3$ times : $P(X=3) = binom(7, 3) times (1/3)^3 times (2/3)^4 = (35 * 2^4) / 3^7$ \
    Count for $X$ to be satisfied $lt.eq 2$ times : $ P(X <=t.eq 2) = P(X=0) + P(X = 1) = binom(7, 0)(1/3)^0(2/3)^7 + binom(7, 1)(1/3)^1(2/3)^6 $
    $ = (35 times 2^4) / 3^7 $
  ]
]

#example("Playing Cards")[
  Choose 5 cards out of a deck without replacement.
  $X$: the number of Aces.
  Determine if $X$ is a binomial random variable.

  #solution("", 1)[
    A binomial random variable requires:
    1. A fixed number of trials ($n$).
    2. Each trial has only two outcomes (Success/Failure).
    3. The probability of success ($p$) is constant for each trial.
    4. The trials are independent.

    Here, we are choosing cards *without replacement*.
    - The probability of the first card being an Ace is $4/52$.
    - If the first card was an Ace, the probability of the second card being an Ace is $3/51$.
    - If the first card was not an Ace, the probability of the second card being an Ace is $4/51$.

    Since the probability changes depending on previous outcomes, the trials are *not independent*. Therefore, $X$ is *not* a binomial random variable.
    (Note: $X$ follows a *Hypergeometric distribution*).
  ]
]

#note("Population Research")[
  We consider population research a binomial event. Why is this?
  #analysis()[
    Since populations are very large in size, one person being selected does not have a large effect on the next person's probability.
  ]
]

#example("on-base percentage")[
  Normally, an on-base percentage defines the percentage of a player leaving home base. Since around 2-3 leaves can lead to a score, it is very dangerous to let a player to leave base continuously.

  \ \
  Q. What is the probability of outing three hitters in a row? Calculate for on-base percentage $0.3$ and $0.4$.
  #solution()[
    i) $P = 0.3$
    $ P(X=3) = binom(3, 3) times 0.7^3 times 0.3^0 $
    *$ = 0.342 $*

    ii) $P = 0.4$
    $ P(X = 3) = binom(3, 3) times 0.6^3 times 0.4^0 $
    *$ = 0.216 $*
  ]

  \ \
  Q. What is the probability of allowing two people in once (no double play)?
  #solution()[
    Y: Number of outed hitters when fighting aginst 4 hitters \
    $Y~B(4,0.7" or "0.6)$ \
    For when 0.7 \
    $P(Y>=3)=P(Y=3)+P(Y=4)=binom(4, 3)0.7rd(3)0.3rd(1)+binom(4, 4)0.7rd(4)$ \
    $approx 0.44$ \
    For when 0.6 \

  ]
]


#example("Two-sided 4 dice toss")[
  $X =$ the absolute difference between two outcomes. \
  Find the probability mass function of the system.
  #solution()[
    Since discrete, we can obtain a probability mass function. \
    Probability mass function for $X$: \
    $p(0)=P(X=0)=P{(0,1),(2,2),(3,3),(4,4)}=1/4$\ \
    $p(1) = P(X=1) = P{(1,2),(2,3),(3,4),(2,1),(3,2),(4,3)} = 3/8$\ \
    $p(2) = P(X = 2) = 1/4$\ \
    $p(3) = P(X=3) = 1/8$
  ]
]
