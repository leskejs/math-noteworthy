#import "../../templates/templater.typ": *

= Polar Coordinates

#polar-plot(
  size: (14, 14),
  radius: 5,
  {
    point((2, 2 * calc.sqrt(3)), $P$)
    add-angle((0, 0), 0deg, 60deg, $theta$)
    add-right-angle((2, 0), 0deg, radius: 0.2)
    add-right-angle((0, 2 * calc.sqrt(3)), -90deg, radius: 0.2)
  },
  draw-content: {
    draw.line((0, 0), (2, 2 * calc.sqrt(3)), name: "r")
    draw.line((2, 0), (2, 2 * calc.sqrt(3)), stroke: (dash: "dashed"), name: "x")
    draw.line((0, 2 * calc.sqrt(3)), (2, 2 * calc.sqrt(3)), stroke: (dash: "dashed"), name: "y")
    draw.content(("r.start", 50%, "r.end"), [r], anchor: "north-east", padding: 0.1)
    draw.content(
      "y.start",
      text(fill: active-theme.plot.stroke, size: 7.5pt, [$2 sqrt(3)$]),
      anchor: "east",
      padding: 0.05,
    )
  },
)

The cartesian coordinate of dot $P$ is $(2,2 sqrt(3))$. \
In polar coordinate system, the coordinate of dot $P$ is $(4,pi/3)$.

#definition("Polar Coordinates")[
  In this section, we will study the polar coordinate system (극좌표계). The polar coordinate system uses distances and directions to specify the location of a point in the plane.

  To set up this system, we choose a fixed point $O$ in the plane called the *pole* (or origin, 극점, 원점) and draw from $O$ a half-line called the *polar axis* (극축). Then each point $P$ can be assigned polar coordinates $P(r, theta)$, where
  - $r$ is the distance from $O$ to $P$,
  - $theta$ is the angle between the polar axis and the segment $O P$.

  We use the convention that $theta$ is positive if measured in a counterclockwise direction from the polar axis or negative if measured in a clockwise direction. If $r$ is negative, then $P(r, theta)$ is defined to be the point that lies $|r|$ units from the pole in the direction opposite to that given by $theta$.
]

#example("Plotting Points")[
  Plot the points whose polar coordinates are given.\
  (a) $(1, 3/4pi)$ #h(1em)\
  (b) $(3, -pi/6)$ #h(1em)\
  (c) $(3, 3 pi)$ #h(1em)\
  (d) $(-4, pi/4)$

  #solution("")[
    // TODO: Add plot if needed, or leave as exercise for student to visualize
    (a) Point at distance 1, angle $135^degree$.\
    (b) Point at distance 3, angle $-30^degree$.\
    (c) Point at distance 3, angle $540^degree equiv 180^degree$.\
    (d) Point at distance 4, angle $45^degree + 180^degree = 225^degree$ (opposite direction).
  ]
]

#example("Exercise")[
  Explain why any polar coordinate $P(r, theta)$ represents the same point as
  $ P(r, theta + 2 n pi) " and " P(-r, theta + (2 n + 1)pi), quad n in ZZ. $

  #solution("")[
    *First representation:* $P(r, theta + 2 n pi)$

    Since angles are measured from the polar axis, adding $2 n pi$ (where $n in ZZ$) represents a complete rotation(s) around the origin. After completing full rotation(s), we return to the same direction. The distance $r$ from the pole remains unchanged, so the point is identical to $P(r, theta)$.

    *Second representation:* $P(-r, theta + (2 n + 1)pi)$

    The term $(2 n + 1)pi$ represents rotation by an odd multiple of $pi$, which means rotating by $pi, 3pi, 5pi, ...$ radians. Each of these rotations places us in the *opposite direction* from $theta$.

    When $r$ is negative, we move $|r|$ units in the direction *opposite* to the angle. So $P(-r, theta + (2 n + 1)pi)$ means:
    - Start at angle $theta + (2 n + 1)pi$ (which is opposite to $theta$)
    - Move $|r|$ units in the opposite direction of that angle
    - This brings us to the direction of $theta$ at distance $|r| = r$

    Therefore, both representations describe the same point as $P(r, theta)$.
  ]
]

#example("Finding other representations")[
  Find two other polar coordinate representations of $P(2, pi/3)$ with $r > 0$ and two with $r < 0$.

  #solution("")[
    $r > 0$:
    $ ..., (2, -11 pi/3), (2, -5 pi/3), (2, 7 pi/3), (2, 13 pi/3), ... $

    $r < 0$:
    $ ..., (-2, -8 pi/3), (-2, -2 pi/3), (-2, 4 pi/3), (-2, 10 pi/3), ... $
  ]
]

= Relationship Between Polar and Rectangular Coordinates

1. To change from polar to rectangular coordinates, use the formulas
  $ x = r cos theta " and " y = r sin theta. $
2. To change from rectangular to polar coordinates, use the formulas
  $ r^2 = x^2 + y^2, quad tan theta = y/x (x != 0) $
  or
  $ r^2 = x^2 + y^2, quad cos theta = x/r " and " sin theta = y/r. $

#example("Coordinate Conversion")[
  (a) Find rectangular coordinates for the point that has polar coordinates $(4, 2 pi/3)$. \
  (b) Find polar coordinates for the point that has rectangular coordinates $(2, -2)$.

  #solution("")[
    (a)
    $ x = 4 cos(2 pi/3) = 4 dot (-1/2) = -2 $
    $ y = 4 sin(2 pi/3) = 4 dot (sqrt(3)/2) = 2 sqrt(3) $
    $ therefore (-2, 2 sqrt(3)) $

    (b)
    $ r = plus.minus sqrt(2^2 + (-2)^2) = plus.minus 2 sqrt(2) $
    $ tan theta = -2/2 = -1 $
    $ theta = 3 pi/4 + n pi, (-pi/4) + n pi, quad n in ZZ $

    $ therefore (2 sqrt(2), -pi/4 + 2 n pi), (-2 sqrt(2), 3 pi/4 + 2 n pi), quad n in ZZ $
  ]
]

#note("Remarks")[
  1. In most cases, we assume $r > 0$ and $0 <= theta < 2pi$ in polar coordinates. Under these conditions, each point corresponds uniquely to a single polar coordinate, establishing a one-to-one correspondence with Cartesian coordinates. This convention is often preferred.
  2. The origin $(0,0)$ corresponds to all polar coordinates of the form $(0, theta)$ for any angle $theta$. However, it is generally preferred not to consider the origin explicitly in polar coordinates.
  3. Allowing $r <= 0$ is mainly useful when sketching graphs in polar coordinates, as it simplifies the representation of certain curves.
]

= Polar Equations

#definition("Polar Equation")[
  A *polar equation* (tr. 극방정식) is an equation in the polar coordinates $r$ and $theta$; similarly, a rectangular equation is an equation in the rectangular coordinates $x$ and $y$.
]

#example("Converting to Polar Equation")[
  Express the equation $x^2 = 4y$ in polar coordinates.

  #solution("")[
    (Case 1) $r != 0$
    Since $r^2 = x^2 + y^2 = 4y + y^2$ and $y >= 0$, we have $y != 0$ and therefore $x != 0$, which implies $cos theta != 0$. Then we get
    $ x^2 = 4y $
    $ (r cos theta)^2 = 4r sin theta $
    $ r cos^2 theta = 4 sin theta $
    $ r = (4 sin theta) / (cos^2 theta) = 4 sec theta tan theta $

    (Case 2) $r = 0$
    This corresponds to the origin $(0, 0)$, which also satisfies the equation $x^2 = 4y$.
    However, substituting $theta = 0$ into the expression derived in Case 1 yields $r = 0$, which satisfies the condition in Case 2 as well.
    Therefore, we conclude that
    $ r = 4 sec theta tan theta. $
  ]
]

#example("Converting to Rectangular Equation")[
  Express each polar equation in rectangular coordinates.
  (a) $r = 5 sec theta$ #h(1em) (b) $r = 2 sin theta$ #h(1em) (c) $r = 2 + 2 cos theta$

  #solution("")[
    (a) A vertical line.
    $ r = 5 sec theta arrow.r.double r cos theta = 5 arrow.r.double x = 5 $

    (b) A circle.
    $
      r = 2 sin theta arrow.r.double r^2 = 2r sin theta arrow.r.double x^2 + y^2 = 2y arrow.r.double x^2 + (y - 1)^2 = 1
    $

    (c) A "Cardioid".
    $ r = 2 + 2 cos theta arrow.r.double r^2 = 2r + 2r cos theta arrow.r.double x^2 + y^2 = 2r + 2x $
    $ (x^2 + y^2 - 2x)^2 = 4r^2 = 4(x^2 + y^2) $
  ]
]

#example("Distance Formula")[
  Prove that the distance between the polar points $(r_1, theta_1)$ and $(r_2, theta_2)$ is
  $ d = sqrt(r_1^2 + r_2^2 - 2r_1 r_2 cos(theta_2 - theta_1)). $

  #solution("")[
    The corresponding points in rectangular coordinates for $(r_1, theta_1)$ and $(r_2, theta_2)$ are $(r_1 cos theta_1, r_1 sin theta_1)$ and $(r_2 cos theta_2, r_2 sin theta_2)$, respectively. Then the distance between them is
    $
      d & = sqrt((r_2 cos theta_2 - r_1 cos theta_1)^2 + (r_2 sin theta_2 - r_1 sin theta_1)^2) \
        & = sqrt(r_1^2 + r_2^2 - 2r_1 r_2 (cos theta_2 cos theta_1 + sin theta_2 sin theta_1)) \
        & = sqrt(r_1^2 + r_2^2 - 2r_1 r_2 cos(theta_2 - theta_1)).
    $
  ]
]

#example("Exercise")[
  (a) Use the Law of Cosines to prove the formula above.\
  (b) Find the distance between the points whose polar coordinates are $(3, 3 pi/4)$ and $(-1, 7 pi/6)$.

  #solution("")[
    (a) Consider the triangle formed by the origin $O$ and the two points $P_1(r_1, theta_1)$ and $P_2(r_2, theta_2)$.

    The three sides of this triangle have lengths:
    - From $O$ to $P_1$: length $r_1$
    - From $O$ to $P_2$: length $r_2$
    - From $P_1$ to $P_2$: length $d$ (what we want to find)

    The angle at the origin between the two radii is $theta_2 - theta_1$.

    By the Law of Cosines:
    $ d^2 = r_1^2 + r_2^2 - 2r_1 r_2 cos(theta_2 - theta_1) $

    Taking the square root:
    $ d = sqrt(r_1^2 + r_2^2 - 2r_1 r_2 cos(theta_2 - theta_1)) $

    (b) Given: $P_1(3, 3pi/4)$ and $P_2(-1, 7pi/6)$

    First, note that $P_2(-1, 7pi/6)$ with negative $r$ is equivalent to $P_2(1, 7pi/6 + pi) = P_2(1, 13pi/6)$.

    For simplicity, we can also write this as $P_2(1, pi/6)$ (since $13pi/6 - 2pi = pi/6$).

    Using the distance formula:
    $
      d & = sqrt(3^2 + 1^2 - 2(3)(1)cos(pi/6 - 3pi/4)) \\ & = sqrt(9 + 1 - 6 cos(-7pi/12)) \\ & = sqrt(10 - 6 cos(7pi/12))
    $

    Since $cos(7pi/12) = cos(105^degree) = -sin(15^degree) = -(sqrt(6) - sqrt(2))/4$:
    $
      d & = sqrt(10 - 6 dot (-(sqrt(6) - sqrt(2))/4)) \\
      & = sqrt(10 + (3(sqrt(6) - sqrt(2)))/2) \\
      & = sqrt(10 + (3sqrt(6) - 3sqrt(2))/2)
    $

    Numerically: $d approx sqrt(10 + 1.421) approx sqrt(11.421) approx 3.38$
  ]
]
