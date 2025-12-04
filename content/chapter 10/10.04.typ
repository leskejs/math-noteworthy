#import "../../templates/templater.typ": *

= Shifted Conics
Just as we shift functions $y=f(x)$ by $x arrow.r x-h$ and $y arrow.r y-k$, we can shift conic sections. The standard form becomes centered at $(h, k)$ rather than the origin.

#example("Shifted Ellipse (1)")[
  Take $ (x+1)^2 / 4 + (y-2)^2 / 9 = 1 $ Find how much it was moved from the basic function $ x^2 / 4 + y^2 / 9 = 1 $

  #solution("Analysis", "1")[
    Comparing $(x - (-1))^2$ and $(y - 2)^2$, we see the move is $-1$ in the $x$ direction and $+2$ in the $y$ direction.

    - *Center:* $C(-1, 2)$
    - *Vertices:* Vertical major axis (since $9 > 4$).
      $ V = (-1, 2 plus.minus 3) arrow.r.double (-1, 5), (-1, -1) $
    - *Foci:* $c^2 = 9 - 4 = 5$.
      $ F = (-1, 2 plus.minus sqrt{5}) $

    #rect-plot(size: (6, 7), x-domain: (-4, 2), y-domain: (-2, 6), {
      // Shifted Ellipse: x = -1 + 2cos(t), y = 2 + 3sin(t)
      add-graph(
        t => (-1 + 2 * calc.cos(t), 2 + 3 * calc.sin(t)),
        domain: (0, 2 * calc.pi),
      )
      point((-1, 2), [$C$], pos: "east")
      point((-1, 5), [$V_1$], pos: "south")
      point((-1, -1), [$V_2$], pos: "north")
    })
  ]

]

#example("Shifted Conics Basics (2)")[
  Find the equation of an ellipse with: \
  *Vertices:* $(-7,3), (3,3)$ \
  *Foci:* $(-6,3), (2,3)$

  #solution("Step-by-step", "2")[
    1. *Common Coordinate:* The $y$-coord is 3, so the major axis is horizontal $y=3$.
    2. *Center:* Midpoint of vertices. $ ((-7+3)/2, 3) = (-2, 3) $.
    3. *Dimensions:*
      - Major Radius $a = d(C, V) = 5$.
      - Focal Radius $c = d(C, F) = 4$.
      - Minor Radius $b = sqrt{5^2 - 4^2} = 3$.

    $ therefore frac{(x+2)^{2}}{25}+ frac{(y-3)^{2}}{9} = 1 $
  ]
]

#example("Shifted Parabola (3)")[
  Explain the function $x^2 - 4x = 8y - 28$ as a shift from a basic parabola.

  #solution("Completing the Square", "3")[
    $ x^{2}-4x=8y-28 $
    $ arrow.r.double (x-2)^2 - 4 = 8y - 28 $
    $ arrow.r.double (x-2)^2 = 8y - 24 $
    $ arrow.r.double (x-2)^2 = 8(y-3) = 4\cdot 2(y-3) $

    From this, we know $p = 2$. The graph is the basic parabola $x^2 = 8y$ shifted by vector $(+2, +3)$.

    #rect-plot(size: (8, 6), x-domain: (-4, 8), y-domain: (0, 8), {
      // Parabola: y = (x-2)^2/8 + 3
      add-graph(
        x => (x - 2) * (x - 2) / 8 + 3,
        domain: (-4, 8),
      )
      // Axis of symmetry
      add-graph(
        ((2, 0), (2, 8)),
        style: (stroke: (paint: gray, dash: "dashed")),
      )
      point((2, 3), [$V(2,3)$], pos: "south-east")
      point((2, 5), [$F(2,5)$], pos: "east")
    })
  ]

]

#example("General to Standard Form")[
  Explain the function $9x^2 - 72x - 16y^2 - 32y = 16$ as a shift from a basic hyperbola.

  #solution("Completing the Square", "4")[
    Group $x$ and $y$ terms:
    $ 9(x^{2}-8x) - 16(y^{2}+2y) = 16 $

    Complete the squares (add constants to both sides):
    $ 9(x^{2}-8x+16) - 16(y^{2}+2y+1) = 16 + 144 - 16 $
    $ 9(x-4)^{2} - 16(y+1)^{2} = 144 $

    Divide by 144:
    $ frac{(x-4)^{2}}{16} - frac{(y+1)^{2}}{9} = 1 $

    - *Center:* $C(4,-1)$
    - *Vertices:* Shifted $(plus.minus 4, 0)$ by $C arrow.r.double (0,-1), (8,-1)$
    - *Foci:* $c = sqrt(16+9)=5$. Shifted $( plus.minus 5, 0) arrow.r.double (-1, -1), (9, -1)$


    #rect-plot(size: (10, 6), x-domain: (-2, 10), y-domain: (-6, 4), {
      // Hyperbola centered at (4, -1)
      // Right Branch
      add-graph(
        t => (4 + 4 * calc.cosh(t), -1 + 3 * calc.sinh(t)),
        domain: (-1.3, 1.3),
      )
      // Left Branch
      add-graph(
        t => (4 - 4 * calc.cosh(t), -1 + 3 * calc.sinh(t)),
        domain: (-1.3, 1.3),
      )
      // Asymptotes: y+1 = +/- 3/4 (x-4)
      add-graph(x => 0.75 * (x - 4) - 1, domain: (-2, 10), style: (stroke: (dash: "dotted")))
      add-graph(x => -0.75 * (x - 4) - 1, domain: (-2, 10), style: (stroke: (dash: "dotted")))

      point((4, -1), [$C$])
      point((8, -1), [$V_2$], pos: "north-west")
      point((0, -1), [$V_1$], pos: "north-east")
    })
  ]

]

= Degenerate Conics

#definition("Degenerate Conics")[
  A quadratic equation $A x^2 + C y^2 + D x + E y + F = 0$ is *degenerate* if it does not represent a standard curve, but rather a point, a line, or a pair of lines.

  For $A x^2 + C y^2 + dots = 0$:
  - If $A C > 0$: Degenerate Ellipse (Point or Empty set).
  - If $A C < 0$: Degenerate Hyperbola (Two intersecting lines).
  - If $A C = 0$: Degenerate Parabola (Two parallel lines or one line).
]

#example("Degenerate Hyperbola")[
  Consider the expression $9x^2 - y^2 + 18x + 6y = 0$. Identify the shape.

  #solution("Factoring", "5")[
    $ arrow.r.double 9(x^2 + 2x) - (y^2 - 6y) = 0 $
    $ arrow.r.double 9(x+1)^{2} - (y-3)^{2} = 0 $

    This is a difference of squares $A^2 - B^2 = (A-B)(A+B)$:
    $ arrow.r.double (3(x+1) - (y-3)) \cdot (3(x+1) + (y-3)) = 0 $
    $ arrow.r.double (3x - y + 6)(3x + y) = 0 $

    This represents two intersecting lines:
    $ 3x - y + 6 = 0 quad "or" quad 3x + y = 0 $

    #rect-plot(size: (4, 8), x-domain: (-4, 2), y-domain: (-4, 8), {
      // Line 1: y = 3x + 6
      add-graph(x => 3 * x + 6, domain: (-4, 2))
      // Line 2: y = -3x
      add-graph(x => -3 * x, domain: (-4, 2))
      point((-1, 3), [$P(-1,3)$], pos: "east", padding: 0.6)
    })
  ]
]
