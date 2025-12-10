#import "../../templates/templater.typ": *


= Conic Sections(tr. 원뿔곡선)
- Circle, Ellipse, Hyperbola, Parabola
  - Of course, we can create other shapes such as dots, lines, _hyper-lines_ (two lines). \ These are considered as special cases and we will only consider smooth curves.
- Since circles #sym.in ellipses, let us consider the last three.
- All conic sections can be represented in the form $A x sr + B x y +C y sr + D x + E y + F =0$.
  - Reversibly, if a shape is represented in the from above, it symbolizes a regular curve.
  - Since conic sections can be represented in form of quadratic equations, we also call conic sections as *Quadratic Curve*.

#definition("Parabolae")[
  Let $F$ be a point and $l$ be a line #st $F in.not l$. \
  Then a *parabola* with *focus* $F$ and *directrix* $l$ is a set of all points whose distance from $F$ and $l$ are equal. \
  We call the line perpendicular to the directrix and passing through the focus as the \ *axis(of symmetry)*. \
  We also call the point on the parabola closest to the directrix the *vertex* of the parabola.
  *Lactus rectum*, or *focal diameter* of a parabola is the length of the line parallel to the directrix and passing through the focus. This is sometime referred as a _width_ of the parabola.
  #equation("")[
    Let $F(P,0)$ and $l : x=-p$. \
    A point $P(x,y)$ on the parabola satisfies $d(P,F)=d(P,l)$. \
    $arrow.r.double sqrt((x-p) sr + y sr) = abs(x+p)$ \
    $arrow.r.double (x - p) sr + y sr = (x+p) sr$ \
    $arrow.r.double x sr - 2p x + p sr + y sr = x sr + 2 p x + p sr$ \
    $arrow.r.double cancel(x sr) - 2p x + cancel(p sr) + y sr = cancel(x sr) + 2 p x + cancel(p sr)$ \
    $arrow.r.double -2x p + y sr = 2x p$ \
    $ therefore y sr = 4 p x $
  ]
]

#example("Parabola basics 1")[
  Vertex $V(0,0)$, Focus $F(0,2)$ \
  Find the equation of the parabola.

  // ------------------------------------------------
  // LAZY VERSION: Example 1
  // ------------------------------------------------
  #rect-plot(x-domain: (-5, 5), y-domain: (-3, 6), {
    // Parabola: x^2 = 8y -> y = x^2 / 8
    plot-function(
      x => x * x / 8,
      domain: (-6, 6),
    )

    // Directrix: y = -2
    plot-function(
      x => -2,
      domain: (-6, 6),
      style: (stroke: (dash: "dashed")),
    )

    // Focus
    point((0, 2), [$F(0, 2)$])
  })

  #solution("")[
    Since $p>0$ and the $y$ variable is being altered, we can determine that the parabola will be in the form $x sr = 4 p y$.
    $ therefore x sr = 4 dot.c 2 dot y $
  ]
]

#example("Parabola basics 2")[
  Find the focus and directrix of the parabola $y=-x sr$

  #solution("")[
    // ------------------------------------------------
    // LAZY VERSION: Example 2
    // ------------------------------------------------
    #rect-plot(
      size: (8, 8), // Slightly smaller canvas
      x-domain: (-2.5, 2.5), // Zoomed in
      y-domain: (-2.5, 1), // Shifted view down
      {
        // Parabola: y = -x^2
        plot-function(
          x => -x * x,
          domain: (-2, 2),
        )

        // Directrix: y = 1/4 (since p = -1/4)
        plot-function(
          x => 0.25,
          domain: (-2, 2),
          style: (stroke: (dash: "dashed")),
        )

        // Focus: (0, -1/4)
        point((0, -0.25), [$F(0, -1/4)$], pos: "east")
      },
    )
    $ y=-x sr arrow.r.double x sr = -y = 4 dot (-1/4) dot y $
    $ therefore p=-1/4 $
  ]
]
