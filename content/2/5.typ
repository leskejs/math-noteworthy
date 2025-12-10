#import "../../templates/templater.typ": *

- When the focus is on the origin

#theorem("Redefinition of conics")[
  Let $F$ be a fixed point, $l$ a fixed line, and $e>0$ be a fixed positive number. \
  Then, the set of all points $P$ satisfying $d(P,F) = e times d(P,l)$ is a conic section.
  Moreover,
  - if $e=1$, then the conic section is a parabola.
  - if $e < 1$, then the conic section is an ellipse. \
    #h(1em) #sym.arrow.r.bar If then, $e$ is the eccentricity of the ellips
  - When the focus is on the origin

  #theorem("Redefinition of conics")[
    Let $F$ be a fixed point, $l$ a fixed line, and $e>0$ be a fixed positive number. \
    Then, the set of all points $P$ satisfying $d(P,F) = e times d(P,l)$ is a conic section.
    Moreover,
    - if $e=1$, then the conic section is a parabola.
    - if $e < 1$, then the conic section is an ellipse. \
      #h(1em) #sym.arrow.r.bar If then, $e$ is the eccentricity of the ellipse.
    - if $e > 1$, then the conic section is a hyperbola.

    Also, $F$ is a focus of the conic. \
    In general, we call
    - $F$ as a focus,
    - $l$ as a directrix,
    - $e$ as the eccentricity of the conics.
  ]

  #proof("")[
    Assume that $F(0)$, and let $l : x=d (d>0)$. \
    For polar axis, $r = e(d - r cos theta)$. \
    The cartesian version is $x^2 + y^2 = e^2 (d-x)^2$. \
    If $e=1$, the curve is obviously a parabola. So lets assume that $e != 1$.

    $ x^2 + y^2 = e^2 x^2 + e^2 d^2 - 2d e^2 x $
    $ arrow.r.double (1-e^2)x^2 + 2d e^2 x + y^2 = e^2 d^2 $
    $
      arrow.r.double (1-e^2) (x^2 + (2d e^2)/(1-e^2) x + (d^2 e^4)/(1-e^2)^2) + y^2 = e^2 d^2 + (d^2 e^4)/(1-e^2) = (e^2 d^2)/(1-e^2)
    $
    $ arrow.r.double ((x + (d e^2)/(1-e^2))^2) / ((e^2 d^2)/(1-e^2)^2) + (y^2) / ((e^2 d^2)/(1-e^2)) = 1 $
    $ arrow.r.double a^2 = (e^2 d^2)/(1-e^2)^2 "and" b^2 = (e^2 d^2)/(1-e^2) $
  ]

  As a simplification, we have $(x-h)^2 / a + y^2 / b^2 = 1$. Judging from the values of $b$, $e$ determines the shape of this figure.

  #analysis("Classification : " + $e < 1$)[
    We have $(x-h)^2 / a^2 + y^2 / b^2 = 1$, where
    $ h = -(d e^2)/(1-e^2), quad a = (e d)/(1-e^2), quad b = (e d)/(sqrt(1-e^2)) $
    and $a > b$ (wide horizontally). \
    The focal radius $c$ satisfies
    $ c^2 = a^2 - b^2 = (e^2 d^2)/(1-e^2)^2 - (e^2 d^2)/(1-e^2) = -h $
    $ c = (e^2 d)/(1-e^2) = -h $
    Finally, the eccentricity is
    $ c/a = ((e^2 d)/(1-e^2)) / ((e d)/(1-e^2)) = e $
  ]

  #analysis("Classification : " + $e > 1$)[
    $ ((x + (d e^2)/(1-e^2))^2) / ((e^2 d^2)/(1-e^2)^2) + (y^2) / ((e^2 d^2)/(1-e^2)) = 1 $
    Since $1-e^2 < 0$, substitute $1-e^2$ to $-(e^2-1)$ for simplification
    $ ((x - (d e^2)/(e^2-1))^2) / ((e^2 d^2)/(e^2-1)^2) - (y^2) / ((e^2 d^2)/(e^2-1)) = 1 $
    Let $a = (e d)/(e^2-1)$, $b = f$ // The source text cut off here
  ]
  #let e = $e$
  #let d = $d$

  #analysis("Classification : " + $e > 1$)[
    $ ((x + (d e^2)/(1-e^2))^2) / ((e^2 d^2)/(1-e^2)^2) + (y^2) / ((e^2 d^2)/(1-e^2)) = 1 $
    Since $1-e^2 < 0$, substitute $1-e^2$ to $-(e^2-1)$ for simplification:
    $ ((x - (d e^2)/(e^2-1))^2) / ((e^2 d^2)/(e^2-1)^2) - (y^2) / ((e^2 d^2)/(e^2-1)) = 1 $

    Let $a = (e d)/(e^2-1)$, $b = (e d)/(sqrt(e^2-1))$, $h = (d e^2)/(e^2-1)$. \
    Then, $(x-h)^2 / a^2 - y^2 / b^2 = 1$.

    The focal radius $c$ satisfies:
    $ c^2 = a^2 + b^2 = ((e d)/(e^2-1))^2 + ((e d)/(sqrt(e^2-1)))^2 $
    $ = (e^2 d^2)/(e^2-1)^2 + (e^2 d^2)/(e^2-1) = (e^2 d^2 + e^2 d^2 dot (e^2-1)) / (e^2-1)^2 = (e^4 d^2) / (e^2-1)^2 $
    $ arrow.r.double c = (d e^2) / (e^2-1) = h $
    $
      c/a = ((d e^2)/(e^2-1)) / ((e d)/(e^2-1)) = (cancel(d) e^cancel(2) / cancel(e^2-1)) / (cancel(e d) / cancel(e^2-1)) = e
    $
  ]

  = Polar Equations of Conics

  #theorem("Polar form of conics")[
    Let us return to the original parametric equation. \
    $ r = e(d - r cos theta) $
    $ arrow.r.double r + r e cos theta = e d $
    $ r = (e d) / (1 + e cos theta) $

    Consequently,
    $ r = (e d) / (1 + e cos theta) $
    is a polar equation of a conic with focus $(0,0)$, directrix $x=d$, and eccentricity $e$.

    For when $sin$ and $cos$ is substituted ($r = (e d)/(1 + e sin theta)$), directrix becomes $y=d$.
  ]

  #example("Polar equation basics for conic sections (1)")[
    Parabola, focus $(0,0)$, directrix $y=-6$. \
    Thus $e=1$.
    Find the polar equation.
    #solution("Solution", "")[
      Since the directrix is horizontal ($y = -6$), we use the form involving sine.
      The directrix is below the focus ($y = -6 < 0$), so the form is:
      $ r = (e d) / (1 - e sin theta) $
      Here $e = 1$ and $d = 6$ (distance from focus to directrix).
      $ therefore r = (1 dot 6) / (1 - 1 sin theta) = 6 / (1 - sin theta) $
    ]
  ]

  #example("Polar equation basics for conic sections (2)")[
    What is $r = 10 / (3 - 2 cos theta)$?
    #solution("Solution", "")[
      $ r = 10 / (3 - 2 cos theta) = (10/3) / (1 - 2/3 cos theta) = (2/3 dot 5) / (1 - 2/3 cos theta) $
      $ arrow.r.double e = 2/3, quad d = 5, $ directrix $x=-5$. Since $e<1$, this is an ellipse.
    ]

    #note("TIP")[
      Find $x, y$ intercepts before drawing. In this case, $r = 10, 10/3, 2, 10/3$ for $theta = 0, pi/2, pi, 3pi/2$, respectively.
    ]

    #rect-plot(size: (10, 8), x-domain: (-3, 11), y-domain: (-6, 6), {
      // Ellipse: r = 10 / (3 - 2cos(t))
      // Converted to Parametric: x = r cos(t), y = r sin(t)
      plot-function(
        t => {
          let r = 10 / (3 - 2 * calc.cos(t))
          (r * calc.cos(t), r * calc.sin(t))
        },
        type: "parametric",
        domain: (0, 2 * calc.pi),
      )
      point((0, 0), [$O$], pos: "south-west")
    })
  ]

  #example("Polar equation basics for conic sections (3)")[
    $ r = 12 / (2 + 4 sin theta) = (2 dot 3) / (1 + 2 sin theta) $
    Identify the conic section and find its properties.
    #solution("Solution", "")[
      Rewrite in standard form:
      $ r = 12 / (2(1 + 2 sin theta)) = 6 / (1 + 2 sin theta) $
      Comparing with $r = (e d) / (1 + e sin theta)$:
      $ e = 2, quad e d = 6 arrow.r.double d = 3. $
      Since $e = 2 > 1$, this is a hyperbola.
      Directrix is $y = 3$ (horizontal, above focus).

      Properties:
      - Eccentricity $e = 2$.
      - Directrix $y = 3$.
      - Vertices:
        - $theta = pi/2 arrow.r.double r = 6/(1+2) = 2$. Vertex at $(2, pi/2)$ (polar) or $(0, 2)$ (Cartesian).
        - $theta = 3pi/2 arrow.r.double r = 6/(1-2) = -6$. Vertex at $(-6, 3pi/2)$ (polar) or $(0, 6)$ (Cartesian).
      - Center is midpoint of vertices: $(0, 4)$.
      - $a = 2$ (distance from center to vertex).
      - $c = a e = 2(2) = 4$.
      - $b = sqrt(c^2 - a^2) = sqrt(16 - 4) = sqrt(12) = 2sqrt(3)$.

      #rect-plot(
        size: (8, 8),
        x-domain: (-8, 8),
        y-domain: (-2, 10),
        {
          plot-function(
            t => {
              let r = 6 / (1 + 2 * calc.sin(t))
              (r * calc.cos(t), r * calc.sin(t))
            },
            type: "parametric",
            domain: (-calc.pi/6 + 0.1, 7*calc.pi/6 - 0.1),
          )
          
          plot-function(
            t => {
              let r = 6 / (1 + 2 * calc.sin(t))
              (r * calc.cos(t), r * calc.sin(t))
            },
            type: "parametric",
            domain: (7*calc.pi/6 + 0.1, 11*calc.pi/6 - 0.1),
          )
          point((0, 0), [$F_1$])
          point((0, 8), [$F_2$])
        },
      )
    ]
  ]

  $ r = (e d) / (1 + e cos theta) $ equals the points that suffice $d(P, F) = e dot d(P, l)$.
  Here,
  $ cases(e=1 &"parabola", e>1 &"hyperbola", e<1 &"ellipse") $, where they are all confocal. \
  In the end, if $e gt.double 1$, the parabola approaches a line.

  #example("Polar equation basics for conic sections (4)")[
    What shape does the following expression represent?
    $ r = 10 / (3 - 2 cos(theta - pi/4)) $

    #solution("Solution", "")[
      The term $cos(theta - pi/4)$ represents a rotation of the polar graph by $pi/4$ (45 degrees) counterclockwise.
      Let's analyze the base equation without rotation:
      $ r' = 10 / (3 - 2 cos theta) = (10/3) / (1 - 2/3 cos theta) $
      Here, $e = 2/3 < 1$, so it is an ellipse.
      $e d = 10/3 arrow.r.double (2/3)d = 10/3 arrow.r.double d = 5$.
      Directrix $x = -5$.

      Thus, the given equation represents an *ellipse* with eccentricity $2/3$, rotated by $45^degree$ counterclockwise about the focus (origin).
    ]
  ]

  === Confocal
  e.
  - if $e > 1$, then the conic section is a hyperbola.

  Also, $F$ is a focus of the conic. \
  In general, we call
  - $F$ as a focus,
  - $l$ as a directrix,
  - $e$ as the eccentricity of the conics.
]

#proof("")[
  Assume that $F(0)$, and let $l : x=d (d>0)$. \
  For polar axis, $r = e(d - r cos theta)$. \
  The cartesian version is $x^2 + y^2 = e^2 (d-x)^2$. \
  If $e=1$, the curve is obviously a parabola. So lets assume that $e != 1$.

  $ x^2 + y^2 = e^2 x^2 + e^2 d^2 - 2d e^2 x $
  $ => (1-e^2)x^2 + 2d e^2 x + y^2 = e^2 d^2 $
  $
    => (1-e^2) (x^2 + (2d e^2)/(1-e^2) x + (d^2 e^4)/(1-e^2)^2) + y^2 = e^2 d^2 + (d^2 e^4)/(1-e^2) = (e^2 d^2)/(1-e^2)
  $
  $ => ((x + (d e^2)/(1-e^2))^2) / ((e^2 d^2)/(1-e^2)^2) + (y^2) / ((e^2 d^2)/(1-e^2)) = 1 $
  $ => a^2 = (e^2 d^2)/(1-e^2)^2 "and" b^2 = (e^2 d^2)/(1-e^2) $
]

As a simplification, we have $(x-h)^2 / a + y^2 / b^2 = 1$. Judging from the values of $b$, $e$ determines the shape of this figure.

#analysis("Classification : " + $e < 1$)[
  We have $(x-h)^2 / a^2 + y^2 / b^2 = 1$, where
  $ h = -(d e^2)/(1-e^2), quad a = (e d)/(1-e^2), quad b = (e d)/(sqrt(1-e^2)) $
  and $a > b$ (wide horizontally). \
  The focal radius $c$ satisfies
  $ c^2 = a^2 - b^2 = (e^2 d^2)/(1-e^2)^2 - (e^2 d^2)/(1-e^2) = -h $
  $ c = (e^2 d)/(1-e^2) = -h $
  Finally, the eccentricity is
  $ c/a = ((e^2 d)/(1-e^2)) / ((e d)/(1-e^2)) = e $
]

#analysis("Classification : " + $e > 1$)[
  $ ((x + (d e^2)/(1-e^2))^2) / ((e^2 d^2)/(1-e^2)^2) + (y^2) / ((e^2 d^2)/(1-e^2)) = 1 $
  Since $1-e^2 < 0$, substitute $1-e^2$ to $-(e^2-1)$ for simplification
  $ ((x - (d e^2)/(e^2-1))^2) / ((e^2 d^2)/(e^2-1)^2) - (y^2) / ((e^2 d^2)/(e^2-1)) = 1 $
  Let $a = (e d)/(e^2-1)$, $b = f$ // The source text cut off here
]
#let e = $e$
#let d = $d$

#analysis("Classification : " + $e > 1$)[
  $ ((x + (d e^2)/(1-e^2))^2) / ((e^2 d^2)/(1-e^2)^2) + (y^2) / ((e^2 d^2)/(1-e^2)) = 1 $
  Since $1-e^2 < 0$, substitute $1-e^2$ to $-(e^2-1)$ for simplification:
  $ ((x - (d e^2)/(e^2-1))^2) / ((e^2 d^2)/(e^2-1)^2) - (y^2) / ((e^2 d^2)/(e^2-1)) = 1 $

  Let $a = (e d)/(e^2-1)$, $b = (e d)/(sqrt(e^2-1))$, $h = (d e^2)/(e^2-1)$. \
  Then, $(x-h)^2 / a^2 - y^2 / b^2 = 1$.

  The focal radius $c$ satisfies:
  $ c^2 = a^2 + b^2 = ((e d)/(e^2-1))^2 + ((e d)/(sqrt(e^2-1)))^2 $
  $ = (e^2 d^2)/(e^2-1)^2 + (e^2 d^2)/(e^2-1) = (e^2 d^2 + e^2 d^2 dot (e^2-1)) / (e^2-1)^2 = (e^4 d^2) / (e^2-1)^2 $
  $ => c = (d e^2) / (e^2-1) = h $
  $
    c/a = ((d e^2)/(e^2-1)) / ((e d)/(e^2-1)) = (cancel(d) e^cancel(2) / cancel(e^2-1)) / (cancel(e d) / cancel(e^2-1)) = e
  $
]

= Polar Equations of Conics

#theorem("Polar form of conics")[
  Let us return to the original parametric equation. \
  $ r = e(d - r cos theta) $
  $ => r + r e cos theta = e d $
  $ r = (e d) / (1 + e cos theta) $

  Consequently,
  $ r = (e d) / (1 + e cos theta) $
  is a polar equation of a conic with focus $(0,0)$, directrix $x=d$, and eccentricity $e$.

  For when $sin$ and $cos$ is substituted ($r = (e d)/(1 + e sin theta)$), directrix becomes $y=d$.
]

#example("Polar equation basics for conic sections (1)")[
  Parabola, focus $(0,0)$, directrix $y=-6$. \
  Thus $e=1$.
  $ therefore r = (e dot d) / (1 - e sin theta) = 6 / (1 - sin theta) $
]

#example("Polar equation basics for conic sections (2)")[
  What is $r = 10 / (3 - 2 cos theta)$?
  $ r = 10 / (3 - 2 cos theta) = (10/3) / (1 - 2/3 cos theta) = (2/3 dot 5) / (1 - 2/3 cos theta) $
  $ => e = 2/3, quad d = 5, $ directrix $x=-5$. Since $e<1$, this is an ellipse.

  #note("TIP")[
    Find $x, y$ intercepts before drawing. In this case, $r = 10, 10/3, 2, 10/3$ for $theta = 0, pi/2, pi, 3pi/2$, respectively.
  ]

  #rect-plot(size: (10, 8), x-domain: (-3, 11), y-domain: (-6, 6), {
    // Ellipse: r = 10 / (3 - 2cos(t))
    // Converted to Parametric: x = r cos(t), y = r sin(t)
    plot-function(
      t => {
        let r = 10 / (3 - 2 * calc.cos(t))
        (r * calc.cos(t), r * calc.sin(t))
      },
      type: "parametric",
      domain: (0, 2 * calc.pi),
    )
    point((0, 0), [$O$], pos: "south-west")
  })
]

#example("Polar equation basics for conic sections (3)")[
  $ r = 12 / (2 + 4 sin theta) = (2 dot 3) / (1 + 2 sin theta) $
  $ => e = 2, d = 3, $ directrix $y = 3$. Since $e>1$, this is a hyperbola.
  $ a = 2, quad c = 4, quad b = 2 sqrt(3) $ ($e = c/a$ also stands for all conics.)

  Asymptotes when the denominator approaches to $0$.
  > The slope of asymptote is $tan theta$ of $theta$ for when $1 plus.minus e sin theta "or" cos theta = 0$.
]

$ r = (e d) / (1 + e cos theta) $ equals the points that suffice $d(P, F) = e dot d(P, l)$.
Here,
$ cases(e=1 &"parabola", e>1 &"hyperbola", e<1 &"ellipse") $, where they are all confocal. \
In the end, if $e gt.double 1$, the parabola approaches a line.

#example("Polar equation basics for conic sections (4)")[
  What shape does the following expression represent?
  $ r = 10 / (3 - 2 cos(theta - pi/4)) $

  #solution("Solution", "")[
    Counterclockwise 45#sym.degree to $r = 10 / (3 - 2 cos theta)$
    $ => r = (2/3 dot 5) / (1 - 2/3 cos theta) $
  ]
]

=== Confocal
