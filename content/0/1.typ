#import "../../templates/templater.typ": *

= Graphs of Polar Equations

#definition("Graphing Polar Equations")[
  In this section, we learn how to sketch the graph of a polar equation $r = f(theta)$. To plot points in polar coordinates, it is convenient to use a grid consisting of circles centered at the pole and rays emanating from the pole.
]

#example("A Cardioid")[
  Sketch a graph of $r = 2 + 2 cos theta$.

  #solution("")[
    #polar-plot(
      size: (14, 14),
      radius: 5,
      {
        add-graph(
          t => ((2 + 2 * calc.cos(t)) * calc.cos(t), (2 + 2 * calc.cos(t)) * calc.sin(t)),
          domain: (0, 2 * calc.pi),
          samples: 2000,
        )
      },
    )
    In general, the graph of any equation of the form
    $ r = a(1 plus.minus cos theta) " or " r = a(1 plus.minus sin theta) $
    is a cardioid.
  ]
]

#example("A Four-Leaved Rose")[
  Sketch the curve $r = cos 2 theta$.

  #solution("")[
    #polar-plot(
      size: (10, 10),
      radius: 1.5,
      tick: 0.25,
      {
        add-graph(
          t => (calc.cos(2 * t) * calc.cos(t), calc.cos(2 * t) * calc.sin(t)),
          domain: (0, 2 * calc.pi),
          samples: 2000,
        )
      },
    )
    In general, the rose curves of the form
    $ r = a sin n theta " or " r = a cos n theta $
    have $n$ petals if $n$ is odd, and $2n$ petals if $n$ is even.
  ]
]

#example("Simple cases")[
  Sketch the graphs of the following equations.
  (a) $r = 3$ #h(1em) (b) $theta = pi/3$ #h(1em) (c) $r = 2 sin theta$

  #solution("")[
    (a) $x^2 + y^2 = r^2 = 9$ (Circle radius 3)
    (b) $y/x = tan theta = tan(pi/3) = sqrt(3) arrow.l.r.double y = sqrt(3)x$ (Line)
    (c) $x^2 + (y - 1)^2 = 1$ (Circle shifted up)
  ]
]

#example("A Limacon")[
  Sketch a graph of the equation $r = 1 + 2 cos theta$.

  #solution("")[
    #polar-plot(
      size: (14, 14),
      radius: 4,
      {
        add-graph(
          t => ((1 + 2 * calc.cos(t)) * calc.cos(t), (1 + 2 * calc.cos(t)) * calc.sin(t)),
          domain: (0, 2 * calc.pi),
          samples: 2000,
        )
      },
    )
  ]
]

#example("Exercise (Lemniscate)")[
  Sketch a graph of the equation $r^2 = cos 2 theta$.
  #polar-plot(
    size: (10, 10),
    radius: 1.5,
    tick: 0.25,
    {
      add-graph(
        t => (
          calc.sqrt(calc.abs(calc.cos(2 * t))) * calc.cos(t),
          calc.sqrt(calc.abs(calc.cos(2 * t))) * calc.sin(t),
        ),
        domain: (0, 2 * calc.pi),
        samples: 2000,
      )
    },
  )
]

= Symmetry

In graphing a polar equation $r = f(theta)$, it's often helpful to take advantage of symmetry. We list three tests for symmetry.

#table-plot(
  headers: ("Symmetry", "Test"),
  data: (
    ("With respect to the polar axis", [The polar equation is unchanged if we replace $theta$ by $-theta$.]),
    (
      "With respect to the pole",
      [The polar equation is unchanged if we replace $r$ by $-r$ or $theta$ by $theta + pi$.],
    ),
    (
      [With respect to the line $theta = pi/2$],
      [The polar equation is unchanged if we replace $theta$ by $pi - theta$.],
    ),
  ),
  align-cols: (left, left),
)

Suppose $f(theta) = f(-theta)$ for all $theta$. If a point $(r, theta)$ lies on the graph, then the reflected point $(r, -theta)$ also lie on the graph, since $r = f(theta) = f(-theta)$. Therefore, the graph of $r = f(theta)$ is symmetric with respect to the polar axis.

Let's return to the previous example and consider $f(theta) = 1 + 2 cos theta$. Since $f(theta) = f(-theta)$ for all $theta$, the graph of $r = 1 + 2 cos theta$ is symmetric with respect to the polar axis. Therefore, it suffices to examine the graph for $theta in [0, pi]$ to obtain the entire graph.

#example("Exercise")[
  (a) Explain why the other two symmetry tests imply symmetry with respect to the pole and the line $theta = pi/2$, respectively.
  (b) Sketch the graphs of $r = cos 2 theta$ and $r = 1 - sin theta$ using symmetry tests.

  #solution("")[
    (a) *Symmetry with respect to the pole:*

    If the equation is unchanged when we replace $r$ by $-r$, then whenever $(r, theta)$ is on the graph, so is $(-r, theta)$. But $(-r, theta)$ represents the same point as $(r, theta + pi)$, which is the reflection of $(r, theta)$ through the origin (pole). Therefore, the graph is symmetric with respect to the pole.

    Alternatively, if the equation is unchanged when we replace $theta$ by $theta + pi$, then whenever $(r, theta)$ is on the graph, so is $(r, theta + pi)$, which is the point rotated $180^degree$ around the pole, giving symmetry with respect to the pole.

    *Symmetry with respect to the line $theta = pi/2$:*

    If the equation is unchanged when we replace $theta$ by $pi - theta$, then whenever $(r, theta)$ is on the graph, so is $(r, pi - theta)$. The angle $pi - theta$ is the reflection of $theta$ across the line $theta = pi/2$ (the vertical axis). Therefore, the graph is symmetric with respect to the line $theta = pi/2$.

    (b) *Graph of $r = cos 2 theta$:*

    Testing for symmetry:
    - Polar axis: $f(-theta) = cos(-2theta) = cos(2theta) = f(theta)$ ✓ (symmetric)
    - Pole: $f(theta + pi) = cos(2theta + 2pi) = cos(2theta) = f(theta)$ ✓ (symmetric)
    - Line $theta = pi/2$: $f(pi - theta) = cos(2pi - 2theta) = cos(2theta) = f(theta)$ ✓ (symmetric)

    Since it's symmetric about the polar axis, we only need to graph for $theta in [0, pi]$.
    This is a rose curve with 4 petals (since $n = 2$ is even, giving $2n = 4$ petals).

    *Graph of $r = 1 - sin theta$:*

    Testing for symmetry:
    - Polar axis: $f(-theta) = 1 - sin(-theta) = 1 + sin(theta) != f(theta)$ ✗
    - Pole: $f(theta + pi) = 1 - sin(theta + pi) = 1 + sin(theta) != f(theta)$ ✗
    - Line $theta = pi/2$: $f(pi - theta) = 1 - sin(pi - theta) = 1 - sin(theta) = f(theta)$ ✓ (symmetric)

    Since it's symmetric about $theta = pi/2$, we can graph for $theta in [0, pi]$ and reflect.
    This is a cardioid of the form $r = a(1 - sin theta)$ with the dimple pointing downward.
  ]
]

#example("Intersection Points")[
  Find all the intersection points of the curves given by the polar equations $r = 1/2$ and $r = cos 2 theta$.

  #solution("")[
    (Case 1) $cos 2 theta = 1/2$
    $ 2 theta = (2 n + 1)pi plus.minus 2 pi/3 $
    $ n = 0, cos theta = minus.plus sqrt(3)/2, sin theta = 1/2 $
    $ n = 1, cos theta = plus.minus sqrt(3)/2, sin theta = -1/2 $

    (Case 2) $cos 2 theta = -1/2$
    $ 2 theta = (2 n + 1)pi plus.minus pi/3 $
    $ n = 0, cos theta = minus.plus 1/2, sin theta = sqrt(3)/2 $
    $ n = 1, cos theta = plus.minus 1/2, sin theta = -sqrt(3)/2 $

    $
      therefore 1/2 (plus.minus sqrt(3)/2, 1/2), 1/2 (plus.minus sqrt(3)/2, -1/2), 1/2 (plus.minus 1/2, sqrt(3)/2), 1/2 (plus.minus 1/2, sqrt(3)/2)
    $
  ]
]
