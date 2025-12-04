#import "../../templates/templater.typ": *

= Vectors

= Geometric Description of Vectors

A *vector* (벡터) in the plane is a line segment with an assigned direction. We sketch a vector with an arrow to specify the direction. We denote this vector by $vec(A B)$. Point $A$ is the *initial point* (시점), and $B$ is the *terminal point* (종점). The length of the line segment $A B$ is called the *magnitude* or *length* of the vector and is denoted by $|vec(A B)|$. We use boldface letters to denote vectors, e.g., $u = vec(A B)$. The zero vector, denoted by $0$, represents no displacement.

Two vectors are considered equal if they have equal magnitude and the same direction.

= Vector Arithmetic

- *Addition*: $vec(A C) = vec(A B) + vec(B C)$.
- *Scalar Multiplication*: $c v$ has magnitude $|c||v|$ and direction same as $v$ if $c > 0$, opposite if $c < 0$.
- *Difference*: $u - v = u + (-v)$.

#example("Parallelogram")[
  Let $A B C D$ be a parallelogram. Describe the following vectors using $A, B, C, D$.
  (a) $vec(A B) + vec(A D)$ (b) $vec(A B) - vec(B C)$ (c) $vec(A C) - vec(D C)$

  #solution("")[
    #combi-plot({
      import cetz.draw: *
      grid(
        (-0.5, -0.5),
        (4, 3),
        stroke: gray.transparentize(70%),
      )
      draw-vec((0, 0), (3, 0), label: $vec(A B)$, theme: active-theme)
      draw-vec((0, 0), (0, 2), label: $vec(A D)$, theme: active-theme)
      draw-vec((0, 0), (3, 2), label: $vec(A C)$, color: red, thickness: 2pt, theme: active-theme)
      line((3, 0), (3, 2), stroke: (paint: gray, dash: "dashed"))
      line((0, 2), (3, 2), stroke: (paint: gray, dash: "dashed"))
    })
    (a) $vec(A C)$
    (b) $vec(A B) - vec(A D) = vec(D B)$
    (c) $vec(A C) + vec(C D) = vec(A D)$
  ]
]

= Properties of Vectors

#table-plot(
  headers: ("Vector Addition", "Scalar Multiplication"),
  data: (
    ($(u + v) + w = u + (v + w)$, [$c(u + v) = c u + c v$]),
    ([$u + v = v + u$], [$(c + d)u = c u + d u$]),
    ([$u + 0 = u$], [$(c d)u = c(d u)$]),
    ([$u + (-u) = 0$], [$1 u = u$]),
  ),
  align-cols: (center, center),
)

#example("Exercise")[
  Prove that $0 u = 0$ and $c 0 = 0$.

  #solution("")[
    *Part 1:* Prove $0 u = 0$:
    $ 0 u = (0 + 0)u = 0 u + 0 u $
    Adding $-(0 u)$ to both sides:
    $ 0 = 0 u $

    *Part 2:* Prove $c 0 = 0$:
    $ c 0 = c(0 + 0) = c 0 + c 0 $
    Adding $-(c 0)$ to both sides:
    $ 0 = c 0 $
  ]
]

#example("Hexagon")[
  Let $A B C D E F$ be a regular hexagon, and let $u = vec(A B)$ and $v = vec(A F)$. Describe $vec(A C), vec(A D), vec(F C)$ in terms of $u, v$.

  #solution("")[
    #combi-plot({
      import cetz.draw: *
      let u = (2, 0)
      let v = (1, 1.732)
      grid(
        (-0.5, -0.5),
        (5, 4),
        stroke: gray.transparentize(70%),
      )
      draw-vec((0, 0), u, label: $u$, theme: active-theme)
      draw-vec((0, 0), v, label: $v$, theme: active-theme)
      draw-vec(
        (0, 0),
        (2 * u.at(0) + 2 * v.at(0), 2 * u.at(1) + 2 * v.at(1)),
        label: $vec(A D)$,
        color: green,
        theme: active-theme,
      )
      draw-vec((0, 0), (u.at(0) + v.at(0), u.at(1) + v.at(1)), label: $vec(A C)$, color: blue, theme: active-theme)
    })
    $vec(F C) = 2u$
    $vec(A C) = 2u + v$
    $vec(A D) = 2u + 2v$
  ]
]

= Vectors in the Coordinate Plane

We can represent $v$ as an ordered pair of real numbers, $v = #sym.chevron.l a_1, a_2 #sym.chevron.r$.
$v = #sym.chevron.l x_2 - x_1, y_2 - y_1 #sym.chevron.r$ if initial point is $(x_1, y_1)$ and terminal is $(x_2, y_2)$.

#example("Component Form")[
  (a) Find component form of $u$ with initial $(-2, 5)$ and terminal $(3, 7)$.
  (b) Sketch $w = #sym.chevron.l 2, 3 #sym.chevron.r$.

  #solution("")[
    (a) The component form is found by subtracting the initial point coordinates from the terminal point coordinates:
    $ u = #sym.chevron.l 3 - (-2), 7 - 5 #sym.chevron.r = #sym.chevron.l 5, 2 #sym.chevron.r $

    (b) To sketch $w = #sym.chevron.l 2, 3 #sym.chevron.r$, we draw a vector from the origin $(0, 0)$ to the point $(2, 3)$.
    #combi-plot({
      import cetz.draw: *
      grid(
        (-1, -1),
        (4, 4),
        stroke: gray.transparentize(70%),
      )
      draw-vec((0, 0), (2, 3), label: $w$, color: blue, theme: active-theme)
      circle((2, 3), radius: 0.05, fill: black)
      content((2, 3), [(2, 3)], anchor: "south-west")
    })
  ]
]

#example("Calculation")[
  If $u = #sym.chevron.l 2, -3 #sym.chevron.r$ and $v = #sym.chevron.l -1, 2 #sym.chevron.r$, find $2u - 3v$.

  #solution("")[
    $2 #sym.chevron.l 2, -3 #sym.chevron.r - 3 #sym.chevron.l -1, 2 #sym.chevron.r = #sym.chevron.l 4 + 3, -6 - 6 #sym.chevron.r = #sym.chevron.l 7, -12 #sym.chevron.r$
  ]
]

#example("Linear Combination")[
  In the given figure, find $a, b$ where $vec(O C) = a vec(O A) + b vec(O B)$.
  $vec(O A) = #sym.chevron.l -3, 1 #sym.chevron.r, vec(O B) = #sym.chevron.l 1, 2 #sym.chevron.r, vec(O C) = #sym.chevron.l -1, 5 #sym.chevron.r$.

  #solution("")[
    $#sym.chevron.l -1, 5 #sym.chevron.r = a #sym.chevron.l -3, 1 #sym.chevron.r + b #sym.chevron.l 1, 2 #sym.chevron.r = #sym.chevron.l -3a + b, a + 2b #sym.chevron.r$
    $a = 1, b = 2$.
  ]
]
