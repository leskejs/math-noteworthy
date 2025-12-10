#import "../../templates/templater.typ": *

= Deformed circle
- Deforming the unit circle $x^2+y^2=1$
  - Expand twice for the $y$ axis: $x^2+ (y/2)^2=1$

#definition("Ellipse")[
  Let $F_1, F_2$ be fixed points, and $a>0$ be a fixed positive number. \
  An *ellipse* with *foci* (si. focus) $F_1, F_2$ and *major radius* $a$ (tr. 장반경, the longer radius) is the set of all points whose sum of distances from $F_1$ and $F_2$ is $2a$.

  We can also define the *minor radius* as the shorter radius. The *center* signifies the midpoint of the two foci. From this, we can define the *major and minor axes* as the perpendicular lines that pass through the major and minor radius, respectively. The *vertices* of an ellipse are the intersections of the major axis and the ellipse. Also, we call the distance between the center and a focus as the focal *distance* $c$.

  #equation("Standard Equation")[
    Let $F_1 (c,0)$, $F_2 (-c,0)$ where $(a>c>0)$. \
    Let $P(x,y)$ be a point on the ellipse. \
    We can know, from the definition that $d(P, F_1) + d(P, F_2) = 2a$.

    $ arrow.r.double sqrt((x-c)^2 + y^2) + sqrt((x+c)^2 + y^2) = 2a $
    $ arrow.r.double sqrt((x+c)^2 + y^2) = 2a - sqrt((x-c)^2 + y^2) $
    $ arrow.r.double (x+c)^2 + y^2 = 4a^2 + (x-c)^2 + y^2 - 4a sqrt((x-c)^2 + y^2) $
    $ arrow.r.double 4 c x - 4a^2 = -4a sqrt((x-c)^2 + y^2) $
    $ arrow.r.double (a^2 - c x)^2 = a^2 dot ((x-c)^2 + y^2) $
    $ arrow.r.double a^4 - 2a^2 c x + c^2 x^2 = a^2 x^2 - 2 a^2 c x + a^2 c^2 + a^2 y^2 $
    $ arrow.r.double (a^2 - c^2)x^2 + a^2 y^2 = a^4 - a^2 c^2 $
    $ arrow.r.double x^2 / a^2 + y^2 / (a^2 - c^2) = 1 $

    If we set $b = sqrt(a^2 - c^2)$ (because $a>c>0$), we have:
    $ therefore x^2 / a^2 + y^2 / b^2 = 1 $

    We call $a$ the major radius and $b$ the minor radius. \
    $c$ is sometimes referred as focal radius. \
    $O(0,0)$ is the center of this ellipse. \
    $(a,0), (-a,0)$ are called vertex. (Note: $(0,b),(0,-b)$ are sometimes considered vertices but not in our textbook.) \
    The $x$ axis and $y$ axis is major, minor axis, respectively.
  ]
]

#example("Ellipse basics (1)")[
  For the ellipse $x^2 / 9 + y^2 / 4 = 1$, we can draw it as :
  #rect-plot(size: (8, 6), x-domain: (-4, 4), y-domain: (-3, 3), {
    // Parametric Ellipse: x = 3cos(t), y = 2sin(t)
    plot-function(
      t => (3 * calc.cos(t), 2 * calc.sin(t)),
      type: "parametric",
      domain: (0, 2 * calc.pi),
    )
    // Foci at +/- sqrt(5) approx 2.236
    point((2.236, 0), [$F_1$], pos: "south")
    point((-2.236, 0), [$F_2$], pos: "south")
    // Vertices - FIX: used kebab-case for anchors
    point((3, 0), [$V$], pos: "north-east")
    point((-3, 0), [$V'$], pos: "north-west")
  })

  Identify the focal radius.  \ \
  #solution("", "")[
    $c$ : focal radius
    $ arrow.r.double c^2 = ("major radius")^2 - ("minor radius")^2 = 9 - 4 = 5 $
    $ arrow.r.double "vertex": (3,0), (-3,0), "foci": F_1 (sqrt(5), 0), F_2 (-sqrt(5), 0) $
  ]
]

#example("Ellipse basics (2)")[
  Vertices $(plus.minus 4, 0)$ \
  Foci $(plus.minus 2, 0)$
  Find the equation of the ellipse.

  #rect-plot(size: (8, 6), x-domain: (-5, 5), y-domain: (-4, 4), {
    // a=4, c=2 -> b = sqrt(16-4) = sqrt(12) approx 3.464
    plot-function(
      t => (4 * calc.cos(t), 3.464 * calc.sin(t)),
      type: "parametric",
      domain: (0, 2 * calc.pi),
    )
    point((2, 0), [$F_1$], pos: "south")
    point((-2, 0), [$F_2$], pos: "south")
    // FIX: used kebab-case for anchors
    point((4, 0), [$V$], pos: "south-east")
  })

  #solution("", "")[
    ("major radius") $= 4$ \
    ("focal radius") $= 2$ \
    $ arrow.r.double ("minor radius") = sqrt(4^2 - 2^2) = 2 sqrt(3) $
    $ therefore x^2 / 16 + y^2 / 12 = 1 $
  ]
]

= Eccentricity
How "weird" is an ellipse? \
The quantity showing how the ellipse is similar to the circle.

#definition("Eccentricity")[
  We define *eccentricity* $e$, or how malformed an ellipse is, as $e = ("focal radius") / ("major radius") quad (0 <= e < 1)$ \
  The smaller $e$ gets, the closer the ellipse gets to a perfect circle. \
  $e$ must be smaller than 1 because major radius must always be greater or equal than minor radius.
]

#example("Eccentricity basics")[
  An ellipse has Foci $F(0, plus.minus 8)$ and eccentricity $e = 4/5$. Find the equation of the ellipse.


  #rect-plot(size: (6, 8), x-domain: (-7, 7), y-domain: (-11, 11), x-tick: 2, y-tick: 2, {
    // Vertical Ellipse: c=8, a=10 -> b=6
    // x = 6cos(t), y = 10sin(t)
    plot-function(
      t => (6 * calc.cos(t), 10 * calc.sin(t)),
      type: "parametric",
      domain: (0, 2 * calc.pi),
    )
    point((0, 8), [$F_1$], pos: "west")
    point((0, -8), [$F_2$], pos: "west")
  })


  #solution("", "")[
    The focal radius is 8, and the major radius is $8/e = 10$. Thus, the minor radius is $sqrt(a^2 - c^2) = 6$. \
    Therefore, the equation of the ellipse is $x^2 / 36 + y^2 / 100 = 1$.
  ]
]

= Reflection Property of Ellipse
- Beam started from focus end up to the other focus


#rect-plot(size: (9, 6), x-domain: (-4, 4), y-domain: (-3, 3), {
  // Ellipse a=3, b=2
  plot-function(
    t => (3 * calc.cos(t), 2 * calc.sin(t)),
    type: "parametric",
    domain: (0, 2 * calc.pi),
  )

  // Foci
  let c = 2.236
  point((c, 0), [$F_1$], pos: "south")
  point((-c, 0), [$F_2$], pos: "south")

  // Reflection Point P(x,y)
  // Let x = 1.5, then y = 2 * sqrt(1 - 1.5^2/9) approx 1.732
  let px = 1.5
  let py = 1.732
  point((px, py), [$P$], pos: "north")

  // Beam lines
  // FIX: Use standard list format for lines to avoid function errors
  plot-function(((c, 0), (px, py)), style: (stroke: (paint: red, dash: "dashed"), mark: (end: ">")))
  plot-function(((px, py), (-c, 0)), style: (stroke: (paint: red, dash: "dashed"), mark: (end: ">")))
})
