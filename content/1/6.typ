#import "../../templates/templater.typ": *

// ----------------------------------------------------------------------

#example("Systems of inequalities basics")[
  $
    cases(
      x^2 + y^2 < 25,
      x + 2y >= 5
    )
  $
  Graph the solution set of the system.

  #solution("Geometric Approach", "")[
    Using geometrical intuition:
    1. Inner area of the circle (NOT including the circle itself)
    2. On the graph of $x + 2y >= 5$ (YES including the line itself)
  ]

]

= General strategy of solving systems of inequalities
1. Graph the equation equivalent to the inequalities
2. Test Point

== Test Points
- For each point set, define an arbitrary dot inside each area. We can plugin this point inside the system to see if each area satisfies the given system.
- If the equivalent functions of inequalities are *continuous*, it is trivial that if any point in the area satisfies the inequality, then all point in that area satisfies the inequality. We do not consider noncontinuous functions until actual calculus.

== Linear Programming
- Optimization Strategy
  - ex. minimize cost/time, maximize efficiency/output, etc...
- Composed of?
  - *Decision Parameters*: Values we can select
  - *Objective Function*: The variable we want to maximize/minimize
    - The objective must be expressed as a function of decision parameters
  - *Constraints*: Normally expressed as inequalities of decision parameters

#definition("Optimization")[
  *Optimization* is the act of finding the decision parameters that maximize or minimize the value of the objective function whilst being inside the range of constraints.
]

#definition("Linear Programming")[
  *Linear Programming* is a sub-problem/solution of the optimization problem, where the objective function and the constraints are all described in linear form.
]

- Since linear programming is a broad subject, we are only learning a few basic strategies.

#example("Linear optimization of Stardew Valley")[
  Prof. Lee Jiho really enjoys playing Stardew Valley. For the simplicity of the problem, consider only two actions: fishing and lumbering. Say that we have 10 hours, and 200 strength. Say that fishing takes up 30 minutes and uses 5 strength, while lumbering takes up 20 minutes and uses 10 strength. Say that fishing earns us 50 gold and lumbering earns us 70 gold.

  #align(center)[
    #table(
      columns: 4,
      stroke: none,
      align: center + horizon,
      [*Table 1*], [*time*], [*work*], [*income*],
      [fishing], [30min], [5], [50G],
      [lumbering], [20min], [10], [70G],
    )
  ]
  Formulate the optimization problem.

  #solution("Analysis", "")[
    *Decision parameter:* \
    Do fishing $x$ times, do lumbering $y$ times.

    *Objective function:* \
    $f(x,y) = 50x + 70y$

    *Constraints:* \
    $
      cases(
        30x + 20y <= 600,
        5x + 10y <= 200,
        x, y >= 0
      )
    $

    *Calculation:* \
    Simplify constraints: $3x + 2y <= 60$ and $x + 2y <= 40$. \
    Intersection: $2x = 20 arrow.r.double x = 10, y = 15$. \
    Vertices: $(0,0), (20,0), (0,20), (10,15)$. \
    $f(0,0) = 0$ \
    $f(20,0) = 1000$ \
    $f(0,20) = 1400$ \
    $f(10,15) = 50(10) + 70(15) = 1550$ \
    $therefore$ Maximum income is 1550G at 10 fishing, 15 lumbering.

    #rect-plot(
      size: (8, 8),
      x-domain: (-5, 25),
      y-domain: (-5, 25),
      x-tick: 5,
      y-tick: 5,
      {
        // 3x + 2y <= 60 -> y <= 30 - 1.5x
        plot-function(
          x => 30 - 1.5 * x,
          domain: (0, 20),
          style: (stroke: blue),
        )
        // x + 2y <= 40 -> y <= 20 - 0.5x
        plot-function(
          x => 20 - 0.5 * x,
          domain: (0, 40),
          style: (stroke: red),
        )
        // Vertices
        point((10, 15), [(10, 15)], padding: 3)
        point((0, 20), [(0, 20)], pos: "west", padding: 3)
        point((20, 0), [(20, 0)], pos: "north-west", padding: 1.5)
        point((0, 0), [(0, 0)], pos: "north-west", padding: 1.5)
      },
    )
  ]
]



- Feasible region
  - Region on the plane of objective function that contains available points.
  - In linear programming, we can only look for the values of the vertices, or points of extrema.
    - A maxima or minima WILL BE on the vertices IFF a maxima or minima exists.
  - If the feasible region is *bounded*:
    - The maxima and minima always exist.
    - Can be included in some circle that has a finite radius.

#example("A shipping problem")[
  We have two storage areas. Call them $M$ and $T$. We also have two dealerships, which are called $A$ and $C$. The dealerships worked hard and $A$ sold 12 cars, while $C$ sold 10 cars. The costs for transporting cars by the following table:

  #align(center)[
    #table(
      columns: 2,
      stroke: none,
      align: center,
      [*Action*], [*Cost*],
      [$M -> C$], [50\$],
      [$M -> A$], [40\$],
      [$T -> C$], [60\$],
      [$T -> A$], [55\$],
    )
  ]
  Formulate the optimization problem.

  #solution("Shipping Logic", "")[
    *Decision Parameter:* \
    $x$ cars: $M -> C$ \
    $y$ cars: $M -> A$ \
    $10 - x$ cars: $T -> C$ \
    $12 - y$ cars: $T -> A$

    *Objective function* \
    $C(x,y) = 50x + 40y + 60(10-x) + 55(12-y) = 1260 - 10x - 15y$

    *Constraints* \
    $x, y >= 0$ \
    $x <= 10$ \
    $y <= 12$ \
    $x + y <= 15$ \
    $22 - x - y <= 10 arrow.r.double x + y >= 12$

    *Calculation* \
    Maximize $P = 10x + 15y$ to minimize $C$. \
    Vertices of the feasible region: \
    $(0, 12) arrow.r.double P = 180$ \
    $(3, 12) arrow.r.double P = 210$ \
    $(10, 5) arrow.r.double P = 175$ \
    $(10, 2) arrow.r.double P = 130$ \

    Max $P = 210$ at $(3, 12)$. \
    Min Cost $= 1260 - 210 = 1050$. \
    $therefore$ Minimum cost is 1050\$ by sending: \
    $M -> C: 3, M -> A: 12$ \
    $T -> C: 7, T -> A: 0$
  ]
]

#example("Maximas and Minimas")[
  Find the maximum and the minimum of the function:
  $ f(x,y) = 3x + 2y $

  #solution("Calculation", "")[
    *Constraints* \
    $
      cases(
        x >= 0,
        y >= 0,
        x + y >= 20,
        2x + y >= 30
      )
    $

    *Vertices* \
    Intersection of $x+y=20$ and $2x+y=30$:
    $ (2x+y) - (x+y) = 30 - 20 arrow.r.double x = 10 $.
    $ 10 + y = 20 arrow.r.double y = 10 $.
    Vertex: $(10, 10)$.

    Other vertices on axes:
    - y-axis: $x=0 arrow.r.double y >= 20 "and" y >= 30 arrow.r.double (0, 30)$.
    - x-axis: $y=0 arrow.r.double x >= 20 "and" 2x >= 30 (x>=15) arrow.r.double (20, 0)$.

    Values:
    $f(0,30) = 3(0) + 2(30) = 60$ \
    $f(10,10) = 3(10) + 2(10) = 50$ \
    $f(20,0) = 3(20) + 2(0) = 60$ \
    $therefore$ minimum 50, no maximum (unbounded).

    #rect-plot(
      size: (8, 8),
      x-domain: (-5, 35),
      y-domain: (-5, 35),
      x-tick: 5,
      y-tick: 5,
      {
        // x + y >= 20 -> y >= 20 - x
        plot-function(
          x => 20 - x,
          domain: (0, 20),
          style: (stroke: blue),
        )
        // 2x + y >= 30 -> y >= 30 - 2x
        plot-function(
          x => 30 - 2 * x,
          domain: (0, 15),
          style: (stroke: red),
        )
        // Vertices
        point((10, 10), [(10, 10)], pos: "west", padding: 3)
        point((0, 30), [(0, 30)], pos: "west", padding: 2.5)
        point((20, 0), [(20, 0)], pos: "north-west", padding: 1.5)
      },
    )
  ]
]

#note("Boundedness")[
  If an area is *bounded*, or there exists a circle with center at the origin and some radius that includes the entire area, there always exists a maxima and minima within the region.
]
