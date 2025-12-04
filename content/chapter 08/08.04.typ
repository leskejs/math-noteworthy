#import "../../templates/templater.typ": *

= Plane Curves and Parametric Equations

We can think of a curve as the path of a point moving in the plane; the $x$- and $y$-coordinates of the point are then functions of time $t$. Motivated by this idea, we define a *plane curve* (평면곡선) as the set of points $(f(t), g(t))$ where $f$ and $g$ are functions defined on an interval $I$. The equations
$ x = f(t), quad y = g(t), $
where $t in I$, are *parametric equations* (매개(변수)방정식) for the curve, with *parameter* (매개변수) $t$.

#example("Sketching")[
  Sketch the curve defined by the parametric equations
  $ x = t^2 - 3t, quad y = t - 1. $

  #solution("")[
    We can eliminate the parameter $t = y + 1$.
    $ x = (y + 1)^2 - 3(y + 1) = y^2 - y - 2. $
    This is a parabola.
  ]
]

#example("Moving Object")[
  The following parametric equations model the position of a moving object at time $t$:
  $ x = cos t, quad y = sin t, quad t >= 0. $
  Describe and graph the path.

  #solution("")[
    First, eliminate the parameter $t$ to find the Cartesian equation.
    Recall the identity $cos^2 t + sin^2 t = 1$.
    Substituting $x$ and $y$:
    $ x^2 + y^2 = cos^2 t + sin^2 t = 1. $
    This is a circle of radius 1 centered at the origin $(0, 0)$.

    To determine the direction of motion:
    - At $t = 0$: $(x, y) = (cos 0, sin 0) = (1, 0)$.
    - At $t = pi/2$: $(x, y) = (cos(pi/2), sin(pi/2)) = (0, 1)$.
    Since the object moves from $(1, 0)$ to $(0, 1)$, it moves in a *counterclockwise* direction.

    #rect-plot(
      size: (8, 8),
      x-domain: (-1.5, 1.5),
      y-domain: (-1.5, 1.5),
      {
        add-graph(
          t => (calc.cos(t), calc.sin(t)),
          domain: (0, 2 * calc.pi),
        )
        // Arrow to show direction
        point((0, 1), [$t=pi/2$], pos: "north-east")
        point((1, 0), [$t=0$], pos: "north-east")
      },
    )
  ]
]

#example("Eliminating Parameter")[
  Eliminate the parameter, and sketch the graph of
  $ x = sin t, quad y = 2 - cos^2 t. $

  #solution("")[
    We use the identity $cos^2 t = 1 - sin^2 t$.
    Substitute $sin t = x$ into the equation for $y$:
    $ y = 2 - (1 - sin^2 t) = 2 - (1 - x^2) = 1 + x^2. $

    Now consider the domain. Since $x = sin t$ and $-1 <= sin t <= 1$, we must have $-1 <= x <= 1$.
    Thus, the graph is the segment of the parabola $y = x^2 + 1$ defined on the interval $[-1, 1]$.

    #rect-plot(
      x-domain: (-2, 2),
      y-domain: (0, 3),
      {
        add-graph(
          x => x * x + 1,
          domain: (-1, 1),
        )
        add-graph(
          x => x * x + 1,
          domain: (-2, 2),
          style: (stroke: (dash: "dashed", paint: gray)),
        )
      },
    )
  ]
]

= Finding Parametric Equations for a Curve

#example("Line")[
  Find parametric equations for the line $y = 3x + 2$.
  #solution("")[
    We can choose the parameter $t$ arbitrarily.
    The simplest choice is to let $x = t$.
    Then substituting into the equation gives $y = 3t + 2$.
    Thus, a set of parametric equations is:
    $ x = t, quad y = 3t + 2, quad t in RR. $

    (Note: Other choices are possible, e.g., $x = t - 1$, which would give $y = 3(t-1) + 2 = 3t - 1$.)
  ]
]

#example("Asteroid")[
  Find parametric equations for $x^(2/3) + y^(2/3) = 1$.
  #solution("")[
    We want to use the Pythagorean identity $cos^2 theta + sin^2 theta = 1$.
    Let $x^(2/3) = cos^2 theta$ and $y^(2/3) = sin^2 theta$.
    Solving for $x$ and $y$:
    $ (x^(2/3))^(3/2) = (cos^2 theta)^(3/2) arrow.r.double x = cos^3 theta $
    $ (y^(2/3))^(3/2) = (sin^2 theta)^(3/2) arrow.r.double y = sin^3 theta $

    So the parametric equations are:
    $ x = cos^3 theta, quad y = sin^3 theta, quad 0 <= theta <= 2pi. $

    #rect-plot(
      size: (8, 8),
      x-domain: (-1.5, 1.5),
      y-domain: (-1.5, 1.5),
      {
        add-graph(
          t => (calc.pow(calc.cos(t), 3), calc.pow(calc.sin(t), 3)),
          domain: (0, 2 * calc.pi),
        )
      },
    )
  ]
]

= Cycloid

As a circle rolls along a straight line, the curve traced out by a fixed point $P$ on the circumference of the circle is called a *cycloid*.

#example("Cycloid Equation")[
  If the circle has radius $r$ and rolls along the x-axis, with one position of the point $P$ being at the origin, find parametric equations for the cycloid.

  #solution("")[
    Let $theta$ be the angle of rotation of the circle (in radians).
    Suppose the circle starts with $P$ at the origin $(0, 0)$.
    When the circle has rotated by angle $theta$, its center $C$ has moved horizontally by the arc length $r theta$.
    So the coordinates of the center are $C(r theta, r)$.

    The point $P$ is at a distance $r$ from $C$. Relative to the center $C$, the position of $P$ is given by the angle $3pi/2 - theta$ (since it starts at the bottom $3pi/2$ and rotates clockwise by $theta$).
    Vector $vec(C P) = (r cos(3pi/2 - theta), r sin(3pi/2 - theta)) = (r (-sin theta), r (-cos theta))$.

    The position of $P$ is $vec(O P) = vec(O C) + vec(C P)$:
    $ x = r theta - r sin theta = r(theta - sin theta) $
    $ y = r - r cos theta = r(1 - cos theta) $

    #rect-plot(
      size: (12, 4),
      x-domain: (0, 4 * calc.pi),
      y-domain: (0, 2.5),
      {
        add-graph(
          t => (t - calc.sin(t), 1 - calc.cos(t)),
          domain: (0, 4 * calc.pi),
        )
      },
    )
  ]
]

#example("Track Problem")[
  A track consists of two semicircles of radius 1 and a rectangle of side lengths $pi$ and 2. A circle of radius 1/2 rolls around the track. Find a parametrization of the trajectory of $P$.

  #solution("")[
    The track can be divided into four segments:
    1. *Bottom straight* ($0 <= t <= pi$): The point $P$ moves along a line at height $1/2$.
    2. *Right semicircle* ($pi <= t <= 2pi$): The circle rolls around the outer semicircle of radius 1.
    3. *Top straight* ($2pi <= t <= 3pi$): The point moves along a line at height $3/2$.
    4. *Left semicircle* ($3pi <= t <= 4pi$): The circle rolls around the outer semicircle.

    The parametrization depends on which segment $t$ corresponds to. For the bottom straight section:
    $ x(t) = t - 1/2 sin(2t), quad y(t) = 1/2(1 - cos(2t)), quad 0 <= t <= pi. $

    Similar cycloid-based expressions apply to other segments, with appropriate translations and rotations.
  ]
]

#example("Polar to Parametric")[
  Consider the polar equation $r = theta, 1 <= theta <= 10pi$.
  (a) Express the equation in parametric form.
  (b) Draw a graph.

  #solution("")[
    (a) The relationship between polar and Cartesian coordinates is $x = r cos theta$ and $y = r sin theta$.
    Substituting $r = theta$:
    $ x(theta) = theta cos theta $
    $ y(theta) = theta sin theta $
    where $1 <= theta <= 10pi$.

    (b) This is a spiral.
    #rect-plot(
      size: (10, 10),
      x-domain: (-35, 35),
      y-domain: (-35, 35),
      x-tick: 10,
      y-tick: 10,
      {
        add-graph(
          t => (t * calc.cos(t), t * calc.sin(t)),
          domain: (1, 10 * calc.pi),
        )
      },
    )
  ]
]
