#import "../../templates/templater.typ": *

// Define a custom block for Notation based on the existing theorem-block



= Some background info
Where is counting included?
- Discrete Mathematics (tr. 이산수학)
  - A branch of mathematics dealing with finite sets & calculations
- Combinatorics (tr. 조합론)

#notation("[n]")[
  $[15] = {1, 2, 3, dots, 15}$ \
  Or, to generalize: \
  $ [n] = {1, 2, dots, n} $
]

#definition("Identical Size")[
  We can define two sets $A$ and $B$ have #strong[identical size] iff there exists a bijective function $F: A -> B$.

  Thus, the number of elements on set $S$ is $n$ means that there exists a bijective function $F: S -> [n]$ between the set $S$ and $[n]$.
]

#note("Dice")[
  Set of possible outcomes by throwing 2 dice have #strong[identical size] with:
  $ [6] times [6] = { (i,j) | i,j in [6] } $
]

= The Fundamental Counting Principle

#definition("Principle")[
  Suppose that two events occur in order. If the first event can occur in $m$ ways and the second in $n$ ways, then two events can occur in $m times n$ ways.

  It can be easily shown that for the $k$-th event $E_k$ and its number of possible outcomes $n_k$, the entire events have total outcomes:
  $ product_(i=1)^k n_k $
]

#example("Isn't it a bit too hot?")[
  The ice cream vendor has 3 types of cones and 30 types of flavors. How many types of finished ice cream cones can the vendor serve?

  #solution("", 1)[
    We apply the Fundamental Counting Principle.
    - Step 1: Choose a cone. There are 3 options.
    - Step 2: Choose a flavor. There are 30 options.

    Since these choices are independent and made in sequence, the total number of combinations is the product of the number of options for each step:
    $ 3 times 30 = 90 "types". $
  ]
]

#example("Rationals")[
  For $i,j in [6]$, find the number of possible rationals of the form $i/j$.

  #note("Hint")[
    Simply trying $6 times 6$ won't work here, as the function $[6] times [6] -> S$ is not bijective.
  ]
]

#note("Important note: Fools")[
  If your counting problem reaches a problem, consider the following:
  - You messed up too much (one to one but not onto)
  - You messed up too less (not one to one but onto)
]

#definition("Permutation (tr. 순열)")[
  A permutation of a set is an ordering of the elements of the set.

  #equation(none)[
    For $X$ that $|X|=n$:
    - Selecting $1^("st")$ element: $n$ possibilities
    - Selecting $2^("nd")$ element: $n-1$ possibilities
    - Selecting $3^("rd")$ element: $n-2$ possibilities
    $ dots.v $
    By the Fundamental counting principle, there are in total $n(n-1)(n-2) dots.c 2 dot 1 = n!$ ways of orderings.
  ]

  #definition("Alternative Definition")[
    1:1 onto function that $[r] -> [n]$
  ]
]

#definition("Permutation taken r at a time")[
  A permutation for $[n]$ taken $r$ at a time. Selecting $r$ and give them order.

  In the same way, total ways:
  $ (n!) / ((n-r)!) $
]

#notation("Permutations")[
  We note permutations as $n P r$ or $P(n,r)$ or $""_n P_r$.
]

#definition("Combination taken r at a time")[
  A combination for $[n]$ taken $r$ at a time. Selecting $r$ WITHOUT order.

  In the same way, total ways:
  $ (n!) / (r! (n-r)!) $

  This equals the number of subsets of $[n]$ such that have $r$ elements.
]

#notation("Combinations")[
  We note combinations as $n C r$, $C(n,r)$ or $binom(n, r)$.
]

#example("Car number plate")[
  3 alphabets (distinct), 3 digits. Possible number of license plates?

  #solution("", 1)[
    Choose 3 distinct alphabets out of 26 with order: $P(26,3) = 26 times 25 times 24$ \
    Choose 3 digits out of 0~9: $10 times 10 times 10$ \
    Therefore, the final count becomes $62 times 25 times 24 times 10 times 10 times 10 = 1560000$.
  ]
]

#example("Committee")[
  Choose a chairman, a vice chairman, a secretary (named, order matters) and four other committee members (no order).
  Find the number of ways to choose the committee members.

  #solution("", 1)[
    Selecting 3 named committee members: $P(20,3)$ \
    Result: $P(20,3) times C(17,4)$ \
    \
    *Sol 2:* Pick 7 with order and divide by $4!$.
  ]
]

= Other Counting Methods

== Permutation with repetition
- No. of permutation with repetition of $n$ objects taken $r$ at a time:
- $ n underbrace(times n times dots.c times, r) n = n^r $
- Number of *every* function $[r] -> [n]$
- (tr. 중복순열)

== Combination with repetition
- Number of combinations with repetition of $n$ objects taken $r$ at a time.
- (tr. 중복조합)
- Set (no order) where it can have multiple identical elements: *multiset*.
  - Combination with repetition have a one-to-one relationship with multiset.

#notation("Combination with Repetitions")[
  $ H(n,r) = ""_n H_r = C(n+r-1, r) $
]

#equation("Stars and Bars")[
  Put $r$ objects to $n$ boxes. Objects aren't distinguishable whereas boxes are.
  Let's think of boxes divided by $|$ and objects represented as $*$

  $ | underbrace(*, "object") | * | * * | underbrace(space, "box") | $

  Then, the methods to put objects to boxes have one-to-one relationship with ordering $|$ and $*$.

  $therefore H(n,r) =$ number of ordering $n-1$ of $|$ and $r$ of $*$ \
  $= C(n+r-1, r)$
]

#example("3 boxes, 5 balls")[
  Find the number of ways to distribute 5 balls into 3 boxes.

  #solution("Case 1: Distinguishable balls, Distinguishable boxes", "")[
    Each of the 5 balls can be placed into any of the 3 boxes.
    - Ball 1: 3 choices
    - Ball 2: 3 choices
    - ...
    - Ball 5: 3 choices
    Total ways: $3 times 3 times 3 times 3 times 3 = 3^5 = 243$.
    (This is permutation with repetition).
  ]

  #solution("Case 2: Indistinguishable balls, Distinguishable boxes", "")[
    Since the balls are identical, only the number of balls in each box matters.
    Let $x_1, x_2, x_3$ be the number of balls in box 1, 2, and 3 respectively.
    We need to find the number of non-negative integer solutions to:
    $ x_1 + x_2 + x_3 = 5 $
    Using the Stars and Bars formula (Combination with repetition):
    $ H(3, 5) = C(3 + 5 - 1, 5) = C(7, 5) = C(7, 2) = (7 times 6) / 2 = 21. $
  ]

  #solution("Case 3: Indistinguishable balls, Indistinguishable boxes", "")[
    Since both balls and boxes are identical, we are looking for the number of ways to partition the integer 5 into at most 3 parts (order of boxes doesn't matter).
    We list the possible partitions (formatted as counts in the 3 boxes):
    1. (5, 0, 0) - All in one group
    2. (4, 1, 0)
    3. (3, 2, 0)
    4. (3, 1, 1)
    5. (2, 2, 1)

    Total ways: 5.
  ]
]

== Distinguishable Permutations
- ${1} space {2} space {3} space {4} space {5}$
  - $5! = 120$ ways
- Imagine all balls were painted (now all identical)
  - $1$ way
- What if some were painted and some were not?

#equation(none)[
  $n$ objects, $k$ types. \
  $n_i$ objects for type $i$ ($1 <= i <= k, i in NN$) \
  $ sum_(i=1)^k n_i = n $

  #line(length: 100%, stroke: 0.5pt + gray)

  #solution("F.C.P.")[
    Number of ways to decide the location of objects in type $i$:
    $ C(n - sum_(j=1)^i n_j, n_i) $
    $ arrow.r.double "total ways": (n!) / (n_1! (n-n_1)!) dot ((n-n_1)!) / (n_2! (n-n_1-n_2)!) dots.c (n_k!) / (n_k!) $
    $ = (n!) / (n_1! n_2! n_3! dots.c n_k!) $
  ]
  #solution("")[
    Ways when omitting indistinguishability: $n!$ \
    Ways to change location between same types: $n_1! n_2! n_3! dots.c n_k!$
  ]
]

== Circular Permutation

// Simple native drawing to represent the TikZ diagram


#combi-plot({
  draw-circular(
    (1, 2, 3, 4, 5),
    x: 4,
    y: -1.5,
    radius: 1.5,
  )
})

- Ways of 4 people sitting around the round table: $4!$
- If we are only considering relative position of people, $4! / 4 = 6$
- Circular permutation of $n$: $(n!) / n = (n-1)!$

=== Free circular permutation
- Can be flipped (think of it as a necklace)
- (tr. 염주순열)
- Free circular permutation of $n$: $(n!) / n dot 1/2 = ((n-1)!) / 2$

= Ex) Burnside
- $X$: ordering linearly
- $G$: ordering as free circular permutation (In fact, group)

#definition("Orbit")[
  Orbit of $x in X$, denoted $O_x$.
  Set of every $y$ such that can be obtained by operation of $G$ to $x$.
]

- If all distinguishable: orbit = $2 times text("number of bids")$
- If all identical: orbit = $1$
- More the elements that can be obtained by operation of $G$, less the orbit become.
  - $|O_x| = (|G|) / (|S_x|)$
  - $S_x$: number of $g in G$ such that $x$ become $x$ when applied. (return to initial condition)
  - _(How many $g$ needed to return to original? IDK I don't think this is right)_

- $ sum |F_g| $
  - $F_g$: number of $a in X$ such that don't change by $g$
  - $ sum_(x in X) |S_x| = sum_(g in G) |S_x| = |G| sum_(x in X) 1 / (|O_x|) = |G| dot text("number of orbits") $
  - Number of orbits = $1 / (|G|) sum_(g in G) |F_g|$
