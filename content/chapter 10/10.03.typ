#import "../../templates/templater.typ": *
// Ensure we can use plot.add inside the blocks

// --- Content Start ---

#definition("Hyperbola")[
  Let $F_1$ and $F_2$ be fixed points, and $a > 0$. The set of all points whose difference of the distance from $F_1$ and $F_2$ are equal to $2a$ is called a *hyperbola* with foci $F_1$, $F_2$ and *transverse radius* $a$.

  Center, vertices, and foci are defined similarly to ellipses. We can also define asymptotes and a "central box" to aid construction.

  // VISUALIZATION: General Hyperbola

  #rect-plot(size: (8, 6), x-domain: (-6, 6), y-domain: (-4, 4), {
    // General Hyperbola a=3, b=2
    // Right Branch
    add-graph(
      t => (3 * calc.cosh(t), 2 * calc.sinh(t)),
      domain: (-1.5, 1.5),
    )
    // Left Branch
    add-graph(
      t => (-3 * calc.cosh(t), 2 * calc.sinh(t)),
      domain: (-1.5, 1.5),
    )

    // Asymptotes y = +/- (b/a)x => +/- (2/3)x
    add-graph(
      x => (2 / 3) * x,
      domain: (-5, 5),
      style: (stroke: (paint: rgb("#e0dcb8"), dash: "dashed")),
    )
    add-graph(
      x => -(2 / 3) * x,
      domain: (-5, 5),
      style: (stroke: (paint: rgb("#e0dcb8"), dash: "dashed")),
    )

    // Vertices & Foci
    point((3, 0), [$V_1$], pos: "north-west")
    point((-3, 0), [$V_2$], pos: "north-east")
    point((3.6, 0), [$F_1$], pos: "south", color: rgb("#e46876"))
  })


  #equation("Derivation of Standard Equation")[
    Let $F_1(c, 0)$ and $F_2(-c, 0)$ with $c > a > 0$. Then:
    $ abs(sqrt((x+c)^2+y^2) - sqrt((x-c)^2 + y^2)) = 2a $

    Rearranging and squaring:
    $ (x+c)^2 + y^2 = 4a^2 + (x-c)^2 + y^2 + 4a sqrt((x-c)^2 + y^2) $
    $ 4c x - 4a^2 = 4a sqrt((x-c)^2 + y^2) $
    $ c^2 x^2 - 2c a^2 x + a^4 = a^2 x^2 - 2c a^2 x + a^2 c^2 + a^2 y^2 $

    Grouping terms ($b = sqrt(c^2 - a^2)$):
    $ x^2(c^2 - a^2) - a^2 y^2 = a^2(c^2 - a^2) $
    $ x^2/a^2 - y^2/b^2 = 1 $
  ]
]

= Notable characteristics
We have noted that ellipses are bounded, as the finished form of the equation forms a circle-like result on the plane. However, hyperbolae are unbounded; they diverge to infinity on the edges of all 4 quadrants. Also, while ellipses do not, hyperbolae have two asymptotes, which are $y = plus.minus b/a x$.

#note("Skill: Trick for obtaining asymptotes")[
  $
    lim_(x,y -> infinity) (x^2/a^2 - y^2/b^2 = 1) arrow.r.double x^2/a^2 - y^2/b^2 = 0 arrow.r.double y = plus.minus b/a x
  $
  Just replace the 1 with 0.
]

#example("Hyperbola basics (1)")[
  A hyperbola has vertices $(plus.minus 3, 0)$ and foci $(plus.minus 4, 0)$. Find the equation.


  #rect-plot(size: (8, 5), x-domain: (-6, 6), y-domain: (-4, 4), {
    // a=3, b=sqrt(7) approx 2.65
    add-graph(
      t => (3 * calc.cosh(t), 2.65 * calc.sinh(t)),
      domain: (-1.5, 1.5),
    )
    add-graph(
      t => (-3 * calc.cosh(t), 2.65 * calc.sinh(t)),
      domain: (-1.5, 1.5),
    )

    point((3, 0), [$V$], pos: "north-west")
    point((-3, 0), [$V'$], pos: "north-east")
    point((4, 0), [$F$], color: rgb("#e46876"), pos: "south")
  })


  #solution("Horizontal Form", "1")[
    Vertices $(\pm 3, 0) arrow.r.double a = 3$. \
    Foci $(\pm 4, 0) arrow.r.double c = 4$. \
    $ b^2 = c^2 - a^2 = 16 - 9 = 7 arrow.r.double b = sqrt(7) $
    $ therefore x^2/9 - y^2/7 = 1 $
  ]
]

#example("Hyperbola basics (2)")[
  A hyperbola has vertices $(0, plus.minus 2)$ and asymptotes $y = plus.minus 2x$. Find the equation.

  #rect-plot(size: (6, 6), x-domain: (-4, 4), y-domain: (-5, 5), {
    // Vertical: a=2, b=1
    // x = b sinh(t), y = a cosh(t)
    add-graph(
      t => (1 * calc.sinh(t), 2 * calc.cosh(t)),
      domain: (-1.8, 1.8),
    )
    add-graph(
      t => (1 * calc.sinh(t), -2 * calc.cosh(t)),
      domain: (-1.8, 1.8),
    )

    // Asymptotes y = +/- 2x
    add-graph(x => 2 * x, domain: (-2.5, 2.5), style: (stroke: (dash: "dashed")))
    add-graph(x => -2 * x, domain: (-2.5, 2.5), style: (stroke: (dash: "dashed")))

    point((0, 2), [$V$], pos: "east")
    point((0, -2), [$V'$], pos: "east")
  })


  #solution("Vertical Form", "2")[
    Vertices $(0, \pm 2) arrow.r.double a = 2$ (on y-axis). \
    Asymptotes for vertical: $y = \pm a/b x$. \
    Given $y = \pm 2x arrow.r.double a/b = 2$. \
    $ 2/b = 2 arrow.r.double b = 1 $.
    $ therefore y^2/4 - x^2 = 1 $
  ]
]
