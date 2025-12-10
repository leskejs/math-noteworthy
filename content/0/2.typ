#import "../../templates/templater.typ": *

= Polar Form of Complex Numbers; De Moivre's Theorem

= Graphing Complex Numbers

We need two axes to graph complex numbers: one for the real part and one for the imaginary part. We call these the *real axis* (tr. 실수축) and the *imaginary axis* (tr. 허수축), respectively. The plane determined by these two axes is called the *complex plane* (tr. 복소평면). To graph the complex number $a + b i$, we plot the ordered pair of numbers $(a, b)$ in this plane.

Recall that the absolute value of a real number can be thought of as its distance from the origin on the real number line. We define absolute value for complex numbers in a similar fashion. The *modulus* (or absolute value, 절댓값) of the complex number $z = a + b i$ is
$ |z| = sqrt(a^2 + b^2). $

#example("Moduli")[
  Find the moduli of the complex numbers $3 + 4 i$ and $8 - 5 i$.

  #solution("")[
    The modulus of a complex number $z = a + b i$ is defined as $|z| = sqrt(a^2 + b^2)$.

    For $3 + 4 i$:
    $ |3 + 4 i| = sqrt(3^2 + 4^2) = sqrt(9 + 16) = sqrt(25) = 5. $

    For $8 - 5 i$:
    $ |8 - 5 i| = sqrt(8^2 + (-5)^2) = sqrt(64 + 25) = sqrt(89). $
  ]
]

The set $C = {z in CC : |z| = 1}$ is called the *unit circle*, and $D = {z in CC : |z| <= 1}$ is called the *(closed) unit disk*.

= Euler's Formula

#theorem("Euler's Formula")[
  $ e^(i theta) = cos theta + i sin theta, quad theta in RR $
  In particular, we have
  $ e^(i pi) + 1 = 0. $
]

Euler's formula is often called the most beautiful formula in the world. It brings together five of the most fundamental constants in mathematics—$e, i, pi, 1, "and" 0$—in a single equation.

#note("Motivation")[
  It is well-known that
  $ e^x = 1 + x/1! + x^2/2! + x^3/3! + ... $
  $ sin x = x - x^3/3! + x^5/5! - x^7/7! + ... $
  $ cos x = 1 - x^2/2! + x^4/4! - x^6/6! + ... $
  holds true for all $x in RR$. If $e^x$ is well-defined for all $x in CC$, then
  $
    e^(i theta) & = 1 + (i theta)/1! + (i theta)^2/2! + (i theta)^3/3! + ... \
                & = 1 + (i theta)/1! - theta^2/2! - (i theta^3)/3! + theta^4/4! + ... \
                & = (1 - theta^2/2! + theta^4/4! - ...) + i(theta - theta^3/3! + theta^5/5! - ...) \
                & = cos theta + i sin theta.
  $
]

= Polar Form of Complex Numbers

A complex number $z = a + b i$ has the *polar form* (or trigonometric form, tr. 극형식)
$ z = r (cos theta + i sin theta) = r e^(i theta), $
where $r = sqrt(a^2 + b^2)$ and $tan theta = b/a$ ($a != 0$).
The number $r$ is the modulus of $z$, and $theta$ is called an *argument* (tr. 편각) of $z$.

#note("Remark")[
  The argument of $z$ is not unique, but any two arguments of $z$ differ by a multiple of $2pi$.
]

#example("Polar Form")[
  Write each complex number in polar form.
  (a) $1 + i$ #h(1em) (b) $-4 sqrt(3) - 4 i$

  #solution("")[
    (a) $1 + i = sqrt(2)(cos(pi/4) + i sin(pi/4))$
    (b) $-4 sqrt(3) - 4 i = 8(cos(7pi/6) + i sin(7pi/6))$
  ]
]

#example("Properties of the Modulus")[
  Verify the property for the complex numbers $omega$ and $z$.
  (a) $|overline(z)| = |z|$ #h(1em) (b) $z overline(z) = |z|^2$ #h(1em) (c) $|omega z| = |omega||z|$
  (d) $|1/z| = 1/(|z|) (z != 0)$ #h(1em) (e) $|omega/z| = (|omega|)/(|z|) (z != 0)$

  #solution("")[
    (c) Let $omega = a + b i$ and $z = c + d i$. Then
    $
      |omega z| & = |(a c - b d) + (a d + b c)i| \
                & = sqrt((a c - b d)^2 + (a d + b c)^2) \
                & = sqrt(a^2 c^2 + b^2 d^2 + a^2 d^2 + b^2 c^2) \
                & = sqrt((a^2 + b^2)(c^2 + d^2)).
    $
  ]
]

= Triangle Inequality

#theorem("Triangle Inequality")[
  Let $z_1, z_2 in CC$. Then
  $ |z_1 + z_2| <= |z_1| + |z_2|. $
]

#example("Exercise")[
  Let $z = Re(z) + i Im(z)$. Prove the following.
  (a) $Re(z), Im(z) <= |z|$
  (b) $z + overline(z) = 2 Re(z)$
  (c) $z - overline(z) = 2i Im(z)$

  #solution("")[
    (a) Let $z = a + b i$ where $a = Re(z), b = Im(z)$. Then
    $ |z| = sqrt(a^2 + b^2) >= sqrt(a^2) = |a| >= a = Re(z) $
    Similarly, $|z| >= |b| >= b = Im(z)$.

    (b) Let $z = a + b i$. Then $overline(z) = a - b i$, so
    $ z + overline(z) = (a + b i) + (a - b i) = 2a = 2 Re(z). $

    (c) $z - overline(z) = (a + b i) - (a - b i) = 2b i = 2i Im(z)$.
  ]
]

#proof[
  It is enough to show that $|z_1 + z_2|^2 <= (|z_1| + |z_2|)^2$.
  $
    |z_1 + z_2|^2 & = (z_1 + z_2) overline((z_1 + z_2)) \
                  & = |z_1|^2 + z_1 overline(z_2) + z_2 overline(z_1) + |z_2|^2 \
                  & = |z_1|^2 + 2 Re(z_1 overline(z_2)) + |z_2|^2 \
                  & <= |z_1|^2 + 2|z_1 overline(z_2)| + |z_2|^2 \
                  & = (|z_1| + |z_2|)^2.
  $
]

#example("Exercise")[
  Show that $|sum_(i=1)^n z_i| <= sum_(i=1)^n |z_i|$. (Hint: Use induction.)

  #solution("")[
    *Base case:* For $n = 1$, $|z_1| <= |z_1|$ is trivially true.

    *Inductive step:* Assume the statement holds for $n = k$:
    $ |sum_(i=1)^k z_i| <= sum_(i=1)^k |z_i|. $

    For $n = k + 1$:
    $
      |sum_(i=1)^(k+1) z_i| & = |sum_(i=1)^k z_i + z_(k+1)| \
                            & <= |sum_(i=1)^k z_i| + |z_(k+1)| quad "(by triangle inequality)" \
                            & <= sum_(i=1)^k |z_i| + |z_(k+1)| quad "(by inductive hypothesis)" \
                            & = sum_(i=1)^(k+1) |z_i|.
    $
    By mathematical induction, the statement holds for all $n >= 1$.
  ]
]

#note("Reverse Triangle Inequality")[
  $ ||z_1| - |z_2|| <= |z_1 + z_2| <= |z_1| + |z_2|. $
]

#example("Zero Location")[
  Show that every zero $z_0$ of the polynomial
  $ P(z) = z^4 - 2 i z^3 + (1 + 3 i)z^2 + 3z - 9 $
  satisfies $|z_0| > 1$.

  #solution("")[
    Suppose $|z_0| <= 1$. Then
    $
      |P(z_0)| & >= |-9| - |z_0^4 - 2 i z_0^3 + (1 + 3 i)z_0^2 + 3z_0| \
               & >= 9 - (|z_0|^4 + 2|z_0|^3 + 2|z_0|^2 + 3|z_0|) \
               & >= 9 - (1 + 2 + 2 + 3) = 1.
    $
    This contradicts $P(z_0) = 0$.
  ]
]

= Definition of the Exponential Function

We now define the exponential function for complex numbers. For $z = x + y i$, where $x, y in RR$, we set
$ e^z := e^(x+y i) = e^x e^(y i) = e^x (cos y + i sin y). $

= Properties of the Exponential Function

#theorem("Properties")[
  For $z, z_1, z_2 in CC$ and $n in ZZ$, the following properties hold:
  1. $e^z != 0$
  2. $e^(z_1 + z_2) = e^(z_1) e^(z_2)$
  3. $e^0 = 1, e^(-z) = 1/e^z$
  4. $(e^z)^n = e^(n z)$
  5. (De Moivre's theorem) $(e^(i theta))^n = e^(i n theta), theta in RR$
  6. $e^z = overline(e^overline(z))$
  7. $e^z = 1 arrow.l.r.double z = 2 n pi i$
]

#example("Exercise")[
  Prove that for $z_1, z_2 in CC$ and $z_2 != 0$,
  $ e^(z_1) / e^(z_2) = e^(z_1 - z_2). $

  #solution("")[
    Using property 2 from the theorem (the exponential addition property):
    $ e^(z_1 - z_2) dot e^(z_2) = e^((z_1 - z_2) + z_2) = e^(z_1). $

    Dividing both sides by $e^(z_2)$ (which is nonzero by property 1):
    $ e^(z_1 - z_2) = e^(z_1) / e^(z_2). $
  ]
]

#example("Complex Multiplication")[
  Let $z_1 = 2(cos(pi/4) + i sin(pi/4))$ and $z_2 = 5(cos(pi/3) + i sin(pi/3))$.
  Find (a) $z_1 z_2$ and (b) $z_1 / z_2$.

  #solution("")[
    $z_1 = 2e^(pi i/4), z_2 = 5e^(pi i/3)$.
    (a) $z_1 z_2 = 10e^(7pi i/12) = 10(cos(7pi/12) + i sin(7pi/12))$
    (b) $z_1 / z_2 = 2/5 e^(-pi i/12) = 2/5 (cos(pi/12) - i sin(pi/12))$
  ]
]

= De Moivre's Theorem

#theorem("De Moivre's Theorem")[
  For $z = r(cos theta + i sin theta) = r e^(i theta)$,
  $ z^n = r^n (cos n theta + i sin n theta) = r^n e^(i n theta), quad n in ZZ. $
]

#example("Calculation")[
  Find $(1/2 + 1/2 i)^10$.

  #solution("")[
    First, convert to polar form:
    $ r = sqrt((1/2)^2 + (1/2)^2) = sqrt(1/2) = 1/sqrt(2) $
    $ theta = op("arctan")(1) = pi/4 $

    So $1/2 + 1/2 i = 1/sqrt(2) e^(pi i/4)$.

    By De Moivre's theorem:
    $
      (1/2 + 1/2 i)^10 & = (1/sqrt(2))^10 e^(10 pi i/4) \
                       & = 1/32 e^(5 pi i/2) \
                       & = 1/32 e^(pi i/2) quad "(since" e^(2pi i) = 1")" \
                       & = 1/32 (cos(pi/2) + i sin(pi/2)) \
                       & = 1/32 i.
    $
  ]
]

= $n$th Root of Complex Numbers

Now we consider solving an equation of the form $z^n = c$.
Let $z = R e^(i omega)$ and $c = r e^(i theta)$. Then $R^n e^(i n omega) = r e^(i theta)$.
$ R = r^(1/n) " and " omega = (theta + 2k pi)/n, quad k in ZZ. $
Thus, the solutions are given by
$ z_k = r^(1/n) e^(i(theta + 2k pi)/n), quad k = 0, 1, ..., n-1. $

#example("Roots")[
  Find the six sixth roots of $omega = -64$, and graph these roots in the complex plane.

  #solution("")[
    We want to solve $z^6 = -64$.
    First, write $-64$ in polar form:
    $ -64 = 64(cos pi + i sin pi) = 64 e^(pi i). $
    Let $z = r e^(i theta)$. Then $z^6 = r^6 e^(i 6 theta)$.
    Equating the moduli and arguments:
    $ r^6 = 64 arrow.r.double r = 2, $
    $ 6 theta = pi + 2k pi arrow.r.double theta_k = (pi + 2k pi)/6, quad k = 0, 1, 2, 3, 4, 5. $

    The six roots are:
    $
      z_0 & = 2 e^(i pi/6) = 2(cos(pi/6) + i sin(pi/6)) = sqrt(3) + i \
      z_1 & = 2 e^(i 3pi/6) = 2 e^(i pi/2) = 2i \
      z_2 & = 2 e^(i 5pi/6) = 2(cos(5pi/6) + i sin(5pi/6)) = -sqrt(3) + i \
      z_3 & = 2 e^(i 7pi/6) = 2(cos(7pi/6) + i sin(7pi/6)) = -sqrt(3) - i \
      z_4 & = 2 e^(i 9pi/6) = 2 e^(i 3pi/2) = -2i \
      z_5 & = 2 e^(i 11pi/6) = 2(cos(11pi/6) + i sin(11pi/6)) = sqrt(3) - i
    $

    #polar-plot(
      size: (10, 10),
      radius: 3,
      {
        // Circle of radius 2
        plot-function(
          t => (2 * calc.cos(t), 2 * calc.sin(t)),
          type: "parametric",
          domain: (0, 2 * calc.pi),
          style: (stroke: (dash: "dashed", paint: gray)),
        )
        // Roots
        point((calc.sqrt(3), 1), [$z_0$])
        point((0, 2), [$z_1$], pos: "north-east")
        point((-calc.sqrt(3), 1), [$z_2$])
        point((-calc.sqrt(3), -1), [$z_3$])
        point((0, -2), [$z_4$], pos: "north")
        point((calc.sqrt(3), -1), [$z_5$])
      },
    )
  ]
]

= Complex Trigonometric Functions

$ cos z = (e^(i z) + e^(-i z))/2, quad sin z = (e^(i z) - e^(-i z))/(2 i). $

#example("Exercise")[
  How are $sinh z$ and $cosh z$ defined? Justify your answer.

  #solution("")[
    By analogy with the definitions of $cos z$ and $sin z$:
    $ cosh z = (e^z + e^(-z))/2, quad sinh z = (e^z - e^(-z))/2. $

    These definitions are justified because they reduce to the standard hyperbolic functions when $z in RR$, and they satisfy the same differential equations and identities as the real hyperbolic functions. For example:
    - $cosh^2 z - sinh^2 z = 1$
    - $d/(d z) cosh z = sinh z$ and $d/(d z) sinh z = cosh z$
  ]
]

#example("Zeros")[
  Show that $cos z = 0 arrow.l.r.double z = (2k + 1)pi/2$ for some $k in ZZ$.

  #solution("")[
    $ cos z = (e^(i z) + e^(-i z))/2 = 0 $
    $ arrow.l.r.double e^(i z) + e^(-i z) = 0 $
    $ arrow.l.r.double e^(i z) = -e^(-i z) $
    $ arrow.l.r.double e^(2 i z) = -1 = e^(pi i) $
    $ arrow.l.r.double 2 i z = (2k + 1)pi i " for some " k in ZZ $
    $ arrow.l.r.double z = (2k + 1)pi/2. $
  ]
]

= Argument and the Principal Value

$op("arg") z$ is any argument. $op("Arg") z$ is the unique value $theta$ such that $-pi < theta <= pi$.

#example("Principal Value")[
  Find the principal argument $op("Arg")(z)$ for each complex number.
  (a) $1 + i$ #h(1em) (b) $-5 i$ #h(1em) (c) $-1 + sqrt(3)i$ #h(1em) (d) $-1$

  #solution("")[
    Recall that $op("Arg")(z)$ is the unique angle $theta$ such that $z = |z|e^(i theta)$ and $-pi < theta <= pi$.

    (a) $z = 1 + i$.
    This point is in Quadrant I.
    $ tan theta = 1/1 = 1 arrow.r.double theta = pi/4. $
    Since $pi/4 in (-pi, pi]$, $op("Arg")(1 + i) = pi/4$.

    (b) $z = -5 i$.
    This point lies on the negative imaginary axis.
    The angle is $-pi/2$.
    $ op("Arg")(-5 i) = -pi/2. $

    (c) $z = -1 + sqrt(3)i$.
    This point is in Quadrant II (since $x < 0, y > 0$).
    $ tan alpha = |sqrt(3)/(-1)| = sqrt(3) arrow.r.double alpha = pi/3 $ (reference angle).
    $ theta = pi - pi/3 = 2pi/3. $
    $ op("Arg")(-1 + sqrt(3)i) = 2pi/3. $

    (d) $z = -1$.
    This point lies on the negative real axis.
    By definition, the argument is $pi$.
    $ op("Arg")(-1) = pi. $
  ]
]

= Complex Logarithm

$ log z = ln |z| + i op("arg") z, quad z != 0. $
$ op("Log") z = ln |z| + i op("Arg") z. $

#example("Logarithm")[
  Find all values of (a) $log(1 - i)$ (b) $log(3 + 2 i)$ (c) $op("Log")(-1 + sqrt(3) i)$.

  #solution("")[
    (a) $|1 - i| = sqrt(2)$, $op("arg")(1 - i) = -pi/4 + 2k pi$
    $ log(1 - i) = ln(sqrt(2)) + i(-pi/4 + 2k pi) = 1/2 ln 2 + i(-pi/4 + 2k pi), quad k in ZZ $

    (b) $|3 + 2i| = sqrt(13)$, $op("arg")(3 + 2i) = op("arctan")(2/3) + 2k pi$
    $ log(3 + 2i) = ln(sqrt(13)) + i(op("arctan")(2/3) + 2k pi), quad k in ZZ $

    (c) $|-1 + sqrt(3)i| = 2$, $op("Arg")(-1 + sqrt(3)i) = 2pi/3$
    $ op("Log")(-1 + sqrt(3)i) = ln 2 + i(2pi/3) $
  ]
]

= Complex Exponents

$ z^alpha = e^(alpha log z). $

#example("Exponents")[
  Find all values for (a) $i^(1/2)$ (b) $i^i$ (c) $5^(1/2)$.

  #solution("")[
    (a) $i^(1/2) = e^(1/2 log i) = plus.minus e^(pi i/4)$
    (b) $i^i = e^(i log i) = e^(-(pi/2 + 2k pi))$
    (c) $5^(1/2) = plus.minus sqrt(5)$
  ]
]
