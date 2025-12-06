#import "../../templates/templater.typ": *

= What is probability?
- Ratio of certain result when event was repeated for large number?
  - Coin throwing: what if 4987 heads for 10000 throw?
  - We can't ever prove it.

#note("Learn More")[
  Fun fact, the universe is composed up of only uncertain knowledge; as the total sum of knowledge never increases. Only deductive reasoning proves 100% correct numbers, but it is always a subset of known information. Induction or analogy creates seemingly new information, but it has the chance of being uncertain.
]

= Three elements of probabilistic models
- Model to explain phenomenon that can't be predicted
  - Limit of measurement
  - *Heisenberg* Uncertainty Principle

== 1. Sample Space

#definition("Sample Space")[
  #strong[Sample Space] $S$ is defined as the set including all *possibilities*. For instance, the sample Space of throwing a coin will be:
  $ S = { underbrace(H, "heads"), space underbrace(T, "tails") } $
]

- Throwing the coin; #strong[experiment]; can be known as dissipation of uncertainty.
  - This can also be said as selecting one element of $S$.

== 2. Events

#definition("Event")[
  An #strong[event] is a case where the probability function breaks down due to an #strong[experiment], resulting in a deterministic event which is an element of the sample space.

  It can be said that the #strong[event is a subset of the sample space].

  Take a die for example.
  #list(
    [*Event where 1 comes out : ${1}$*],
    [*Event where even comes out : ${2,4,6}$*],
    [*Event where number larger than 4 comes out : ${5,6}$*],
    [*Event where positive integer comes out : ${1,2,3,4,5,6}$ (#strong[Certain Event])*],
    [*Event where 7 comes out : $phi$ (#strong[Null Event])*],
  )

  From this, we can note that an event has a one-to-one correspondence with the set of elements within $S$ that trigger the event. Thus, we can define event as a subset of the sample space. To say otherwise, when a $s in S$ is selected, for event $E$:

  $
    cases(
      s in E & : E " has occured",
      s in.not E & : E " has not occured"
    )
  $
]

== 3. Probability
- There must be a properties that probability must have.
  - The sum must be 1.

#definition("Probability")[
  Probability $P(E) in [0,1]$ is a number that somehow(...) represents the *likeliness* of event $E$ and satisfies the essential properties.
]

#equation("Identical likeliness")[
  If every element of $S$ is equally likely and $S$ is a finite set, for an event $E$,
  $ P(E) = (n(E)) / (n(S)) = (|E|) / (|S|) $
]

#example("Throwing 2 coins")[
  Benjamin has two coins. For simplicity, call them $A$ and $B$. What is the sample space for all possible faces? What is the sample space for the number of heads? Calculate the probability from our equation in the definition of probability. Is there a difference? Why? Explain your answer.

  #solution("", 1)[
    $S_1 = {H H, H T, T H, T T}$ \
    $ P(E)_1 = (n(E)) / (n(S_1)) = 1/4 $

    On the other hand, \
    $ S_2 = { 0,1,2 } $ (number of heads) \
    $ P(E)_2 = (n(E)) / (n(S_2)) = 1/3 $

    Why is there a difference? $P(E)_2$ is #strong[wrong] because in $S_2$, the probabilities of each element have different "*likeliness*".
  ]
]

#example("Poker flush")[
  A flush is a five-card hand with the same suit. What is the probability that we have a flush?

  #solution("", 1)[
    $S =$ Set of every possible five-card hand \
    $E =$ Event of having same suit \
    $ P(E) = (n(E)) / (n(S)) = (4 times C(13,5)) / (C(52,5)) approx 0.20% $
  ]
]

#note("Dice Dice")[
  Throwing 2 dice \
  $S = [6] times [6] = {(i,j) | i,j in [6]}$ \
  Event $E$: sum of 2 dice is $5$ \
  $E = {(1,4),(2,3),(3,2),(4,1)}$

  #block(inset: 1em, stroke: (left: 2pt + gray), radius: 0pt)[
    *e.g.* \
    $(2,3) in E$: $E$ occurred \
    $(3,4) in.not E$: $E$ not occurred.
  ]
]

== The complement of an event $E$
- (tr. 여사건)

#definition("Complement")[
  #strong[The complement of an event $E$] is defined as $E^c = E' = S - E$.

  Written in set builder form, it becomes
  $ E^c = {c | c in S and c in.not E } $

  It also can be said that $E^c$ is an event where $E$ does not occur.
]

- $P(E^c) = 1 - P(E)$
  - $because n(E^c) = n(S) - n(E)$

== Unions and Intersections of Probability

#definition("Unions and Intersections")[
  The #strong[union] (tr. 합사건) of $E$ and $F$ is written as $E union F$ and is defined as the event where $E$ or $F$ occur. \
  The #strong[intersection] (tr. 곱사건) of $E$ and $F$ is written as $E inter F$ and is defined as the event where $E$ and $F$ occur.

  We can mathematically define $P(E union F) = P(E) + P(F) - P(E inter F)$. Here, if $E inter F = phi$, then $P(E) + P(F)$. This shows a case where *$E$ and $F$ cannot occur mutually*, and is therefore called a #strong[mutually exclusive event].

  #definition("Mutually Exclusive Events")[
    If $E inter F = phi$, we say that $E & F$ are #strong[mutually exclusive] (tr. 배반사건).
  ]
]

== Conditional Probability
- When we observed information partially, it results in a change in probability.
  - The quantity of this change in probability is called #strong[Conditional Probability].

#analysis("Two dice")[
  $A$: Event where sum of two dice is greater or equal than $8$. \
  $B$: Event where $2$ is observed for the first dice.

  If $B$, possible elements of $S$ that can be selected have reduced to $B$.
  The possible outcome that occur $A$ is $(2,6)$ only.

  Probability where $A$ occur after $B$:
  $
    (text("number of possibilities that triggers the event")) / (text("number of every possibilities")) = (n(A inter B)) / (n(B)) = (P(A inter B)) / (P(B))
  $
]

#definition("Conditional Probability")[
  Let $A,B$ be events.
  Then, the conditional probability of $A$ given that $B$ has occurred is defined as:
  $ P(A|B) = (P(A inter B)) / (P(B)) $

  Here, we must note that $P(B) eq.not 0$. Since conditional probability #strong[assumes $B$ has occurred], a probability of $0$ is paradoxical.
]

- For events $A,B$, if probability of $A$ does not change even after knowing $B$, it can be said that $A$ and $B$ are independent.

#definition("Independent")[
  $A,B$ are independent when:
  $ P(A|B) = P(A) $
  or
  $ P(A|B) = (P(A inter B)) / (P(B)) = P(B) arrow.r.double P(A inter B) = P(A)P(B) $
]

#note("Two dice (Independence vs Dependence)")[
  $A_k$: first dice is $k$ \
  $B_k$: second dice is $k$ \
  $C_k$: sum of two dice is $k$

  #solution("Independence", "")[
    $P(A_k) = 1/6$ \
    $P(B_k) = 1/6$ \
    $P(A_k inter B_(k')) = 1/36 = P(A_k)P(B_(k'))$ \
    Thus $A_k$ and $B_(k')$ are #strong[independent].
  ]

  #solution("Dependence", "")[
    $P(C_5) = 1/9$ \
    $P(A_3 inter C_5) = 1/36$ \
    $P(A_3 | C_5) = (P(A_3 inter C_5)) / (P(C_5)) = (1/36) / (1/9) = 1/4$
  ]
]

=== The Law of Total Probability
#definition("Law of Total Probability")[
  Let $F_1,dots,F_n$ be events such that $F_i inter F_j=phi$ and $limits(union.big)_(k=1)^n F_k = S$.

  Then, for an event $E$, $ P(E)=limits(sum)^n_(k=1)P(E|F_k)P(F_k) $
  #proof("")[
    $ limits(sum)_(k=1)^n P(E | F_k)P(F_K) $
    $ =limits(sum)_(k=1)^n P(E inter F_k) $
    $ =P(limits(union)^n_(k=1)(E inter F_k)) $
    $ =P(E inter (limits(union)^n_(k=1)F_k)) $
    $ =P(E inter S)=P(E) $
    #qed
  ]
]

#example("Vaccines")[
  There is a pandemic! We are going to vaccinate people. People have received different doses of vaccines. 10% of the population has received no vaccines, with an infection rate of 5%. 40% of the population received one dose of the vaccine and had an infection rate of 0.5%. 50% of the population had two doses and had a 0.1% infection rate. \ \

  Q : What is the total infection rate?
  #solution("", 1)[
    Let $E$ be the event that someone is infected. let $F_0$ be the event where somebody has 0 doses of vaccination. Define similarly for $F_1$ and $F_2$. \
    $therefore P(E) = P(E|F_0)P(F_0) + P(E|F_1)P(F_1) + P(E|F_2)P(F_2) = 0.75%$
  ]\
  Q: Given that a person is infected, what is the (conditional) probability that they were not vaccinated?
  #solution("", 2)[
    We want to calculate $P(F_1 | E)$. This is equal to : \ \
    $ P(E inter F_1) / P(E) = (P(E|F_1)P(F_1))/P(E) = (P(E|F_1)P(F_1))/(limits(sum)_(k=1)^n P(E|F_K)P(F_K)) $

    Plugging in the values, we can find that $2/3$ of the total infected was not vaccinated. \ \
    The formula we have derived in this example is directly linked with the *Bayes' formula* below.
  ]
]

=== Bayes' Formulae
#equation("")[
  $ P(F_1|E)=(P(E inter F_1))/P(E)=(P(E|F_1)P(F_1))/P(E)=P(E|F_1)P(F_1)/(limits(sum)^n_(k=1)P(E|F_k)P(F_k)) $
  $ therefore P(F_1|E)=(P(E|F_1)P(F_1))/(limits(sum)^n_(k=1)P(E|F_k)P(F_k)) $
]

#example("Drug tests")[
  We are testing for drugs. Every drug test has an error. \
  There are two types : \

  - False Positive(Shows true when the tester did not take drugs, *1%*) \
  - False Negative(Shows false when the tester did take drugs, *1%*). \

  The actual drug usage rate is 0.5%. When my test results show positive, under what possibility have I actually taken drugs?
  #solution("", 1)[
    Let $E$ be the event where my test shows positive and $F$ be the event where I actually took drugs. \
    Using the Bayes' formula,
    $ P(F|E)=(P(E|F)P(F))/(P(E|F)P(F)+P(E|F comp)P(F comp)) $
    $ =(0.99 times 0.005)/(0.99 times 0.005 + 0.01 times 0.995) approx 1/3 $
  ]
]

#example("The Monti-Hall dilemma")[
  The Monti-Hall Dilemma was a very famous TV show from Canada. The rules are the following :
  + There are three doors. One with a car and two with goats.
  + Participant choose one of the three doors.
  + The instructor revels one of the remaining two doors which have goat behind it.
  + Participant can change his/her choice after seeing.
  Find the probability of winning if the participant switches.
  #solution("", "")[
    Let\
    - $A:="There is a car behind the door participant had selected"$
    - $B_k:="There is a car behind k"^"th"" door."$
    - $C_k:="k"^"th"" door is opened by rule 4"$ \ \
    $ P(A|C_1)=(P(C_1|A)P(A))/(P(C_1|A)P(A)+P(C_1|B_1)P(B_1)+P(C_1|B_2)P(B_2)) $
  ]
]

= Exercises
#example("Problem 1")[
  A digital thermometer is placed in the classroom. It shows the temperature between 10~40 in integer. We read the temp at a particular moment. \
  The class dismisses if the temperature is higher than 35 or lower than 15.
  + What is the sample space?
  #solution("", 1)[
    The sample space $S$ consists of all possible integer temperature readings from 10 to 40 inclusive.
    $ S = {10, 11, 12, dots, 40} $
    The size of the sample space is $40 - 10 + 1 = 31$.
  ]
  + What is the event that the class dismisses (as a mathematical object)?
  #solution("", 2)[
    The event $E$ corresponds to temperatures $T$ such that $T < 15$ or $T > 35$.
    $ E = {10, 11, 12, 13, 14, 36, 37, 38, 39, 40} $
    The size of the event is $|E| = 5 + 5 = 10$.
  ]
  + Is the probability that the class dismisses equal to $10/31$? Why or why not?
  #solution("", 3)[
    No, not necessarily.
    The calculation $P(E) = |E|/|S| = 10/31$ assumes that every temperature outcome is *equally likely* (uniform distribution).
    In reality, temperatures like 20-25 are much more likely than 10 or 40. Without knowing the probability distribution of the temperature, we cannot simply count outcomes.
  ]
]

#example("Problem 2")[
  A *straight* is a hand of five cards consisting of five consecutive numbers. (e.g. 4,5,6,7,8) The Jacks are counted as 11, Queens 12, and Kings 13. The Aces are considered as 14 or 1, but not both. Thus, A,K,Q,J,10 and A,2,3,4,5 are straights, but Q,J,K,A,2 is not a straight because the Ace cannot be both 14 and 1 at the same time.

  Find the probability that a five-card hand is a straight. (Include straight flushes in your count).

  #solution("", 1)[
    1. *Count total hands:* $C(52, 5)$.
    2. *Count straights:*
      - There are 10 possible sequences of ranks:
        (A,2,3,4,5), (2,3,4,5,6), ..., (10,J,Q,K,A).
      - For each rank in a sequence, there are 4 possible suits.
      - Since there are 5 cards, there are $4 times 4 times 4 times 4 times 4 = 4^5$ ways to choose suits for a given rank sequence.
      - Total number of straights = $10 times 4^5$.

    $ P("Straight") = (10 times 4^5) / C(52, 5) = (10 times 1024) / 2598960 approx 0.00394 approx 0.4% $
  ]
]

#example("Problem 3")[
  You are given four balls and three boxes. For each ball, choose a box at random and put the ball into that box. \
  What is the probability that no box is empty?
  #solution("", 1)[
    Balls and boxes must be both distinctive.
    #proof("Justification")[
      #combi-plot({
        draw-boxes(3, (4, 0, 0), x: 2, y: 0, label: [Configuration A])
        draw-boxes(3, (3, 1, 0), x: 9, y: 0, label: [Configuration B])
        draw-boxes(3, (2, 2, 0), x: 2, y: -5, label: [Configuration C])
        draw-boxes(3, (2, 1, 1), x: 9, y: -5, label: [Configuration D])
      })
    ]
    Thus, the total probability is $3 rd(4)=81$\
    It is equivalent of finding all onto function $[3]->[4]$
    $ =3^4-2^4 binom(3, 2)+1^4 binom(3, 1) = 81 - 48 + 3 = 36 $
    $ therefore 36/81=4/9 $
  ]
]

#example("Problem 4")[
  Let A and B be independent events with P(A) = 0.4, P(B) = 0.7. Find the probability that precisely one of A or B occurs.

  #solution("", 1)[
    Since the probability is $P(A union B - A inter B)$, $P(A union B - A inter B) = P(A) + P(B) - 2 times P(A inter B) = 0.4 + 0.7 - 2 times 0.4 times 0.7 = 0.54$
  ]
]

#example("Problem 5")[
  In winter, when people leave their houses for a long time, they open their water taps to make water flow so that the pipe does not freeze. \ \
  Before I leave for a vacation, I decide to open the water tap. \
  The probability that the pipe freezes is 5% when I open the tap. \
  The probability that the pipe freezes is 25% when I forget to open the tap. \
  The probability that I forget is 30%. \ \
  #solution("What is the probability that the tap actually freezes?", 1)[
    Let $E$ be event where pipe freezes. \
    Let $F$ be event where I forget. \
    By the total probability law,
    $ P(E) = P(E|F)P(F)+P(E|F comp)P(F comp) $
    $ =5% times 70% + 25% times 30 % \ = 3.5% + 7.5% = 11% $
    $ therefore 11% $
  ]
  #solution("Given that the tap froze, \n what is the probability that I had forgotten to open the tap?", 2)[
    Finding $P(F comp|E)$
    $ = (P(E|F comp)dot P(F comp))/(P(E))=(7.5%)/(3.5% + 7.5%)=15/22 $
  ]
]

#example("Problem 6")[
  In a computer RPG game, your hero passes through an area where a goblin or an orc randomly appear independently.
  The probability of encountering a goblin is $P(G) = 0.3$.
  The probability of encountering an orc is $P(O) = 0.4$.
  Find the probability that you encounter at least one monster.

  #solution("")[
    Let $G$ be the event of encountering a goblin, and $O$ be the event of encountering an orc.
    We are looking for $P(G union O)$.
    Since the events are independent, $P(G inter O) = P(G)P(O)$.

    $
      P(G union O) & = P(G) + P(O) - P(G inter O) \
                   & = 0.3 + 0.4 - (0.3 times 0.4) \
                   & = 0.7 - 0.12 = 0.58.
    $
    Alternatively, using the complement (encountering no monsters):
    $ P(G^c) = 1 - 0.3 = 0.7 $
    $ P(O^c) = 1 - 0.4 = 0.6 $
    $ P((G union O)^c) = P(G^c inter O^c) = P(G^c)P(O^c) = 0.7 times 0.6 = 0.42 $
    $ P(G union O) = 1 - 0.42 = 0.58. $
  ]
]
