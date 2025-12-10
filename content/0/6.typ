#import "../../templates/templater.typ": *

= Equations of Lines Planes

= Equations of Lines in 3D

To specify a line, you need a point and a direction vector.
$ x = p + t v $

#definition("Parametric Equations of a Line")[
  The parametric equations of a line $l$ passing through $P(x_0, y_0, z_0)$ with direction $v = #sym.chevron.l v_1, v_2, v_3 #sym.chevron.r$ are
  $
    #sym.chevron.l x, y, z #sym.chevron.r = #sym.chevron.l x_0 + t v_1, y_0 + t v_2, z_0 + t v_3 #sym.chevron.r, quad t in RR.
  $
]

#example("Line Equation")[
  Find parametric equations for line through $P(1, 2, 4)$ and $Q(3, 1, -1)$.
  #solution("")[
    $vec(P Q) = #sym.chevron.l 2, -1, -5 #sym.chevron.r$.
    $#sym.chevron.l x, y, z #sym.chevron.r = #sym.chevron.l 1 + 2t, 2 - t, 4 - 5t #sym.chevron.r$.
  ]
]

Cartesian Equation (Symmetric Equations):
$ (x - x_0)/v_1 = (y - y_0)/v_2 = (z - z_0)/v_3 $

= Equations of Planes in 3D

A plane is determined by a point and a *normal vector* $n$.
$ n dot (x - p) = 0 arrow.r.double a(x - x_0) + b(y - y_0) + c(z - z_0) = 0. $

#example("Plane Equation")[
  Find Cartesian equation of plane through $P(1, 0, 1), Q(0, -1, 4), R(2, 0, 0)$.
  #solution("")[
    $vec(P Q) = #sym.chevron.l -1, -1, 3 #sym.chevron.r, vec(P R) = #sym.chevron.l 1, 0, -1 #sym.chevron.r$.
    $n = vec(P Q) times vec(P R) = #sym.chevron.l 1, 2, 1 #sym.chevron.r$.
    $1(x - 1) + 2(y - 0) + 1(z - 1) = 0 arrow.r.double x + 2y + z = 2$.
  ]
]

#example("Parametric Plane")[
  Find parametric equations for plane containing $A(1, 0, 0), B(2, 1, 2), C(0, 1, 3)$.
  #solution("")[
    $#sym.chevron.l x, y, z #sym.chevron.r = #sym.chevron.l 1, 0, 0 #sym.chevron.r + s #sym.chevron.l 1, 1, 2 #sym.chevron.r + t #sym.chevron.l -1, 1, 3 #sym.chevron.r$.
  ]
]

= Relative Positions

- Two lines: Intersect, Parallel, or Skew.
- Two planes: Intersect (line) or Parallel.
- Line and Plane: Coincide, Intersect (point), or Parallel.

#example("Intersection")[
  Determine if the line $l$ intersects the plane $pi: x + 2y + 4z = 1$.
  The line $l$ is given by the symmetric equations: $(x+1)/2 = (y+1)/2 = (2-z)/4$.

  #solution("")[
    First, convert the symmetric equations of the line to parametric equations.
    Let $(x+1)/2 = (y+1)/2 = (2-z)/4 = t$.
    Then:
    $ x = 2t - 1 $
    $ y = 2t - 1 $
    $ z = 2 - 4t $

    Substitute these into the equation of the plane:
    $ (2t - 1) + 2(2t - 1) + 4(2 - 4t) = 1 $
    $ 2t - 1 + 4t - 2 + 8 - 16t = 1 $
    $ -10t + 5 = 1 $
    $ -10t = -4 arrow.r.double t = 2/5 $

    Since we found a unique value for $t$, the line intersects the plane.
    To find the point of intersection, substitute $t = 2/5$ back into the parametric equations:
    $ x = 2(2/5) - 1 = 4/5 - 5/5 = -1/5 $
    $ y = 2(2/5) - 1 = 4/5 - 5/5 = -1/5 $
    $ z = 2 - 4(2/5) = 10/5 - 8/5 = 2/5 $

    Thus, the intersection point is $(-1/5, -1/5, 2/5)$.
  ]
]

= Three Perpendiculars Theorem

#theorem("Three Perpendiculars Theorem")[
  Let $alpha$ be a plane, $l$ a line on $alpha$. $H$ on $l$, $O$ on $alpha$ not on $l$, $P$ not on $alpha$.
  1. If $P O perp alpha$ and $O H perp l$, then $P H perp l$.
  2. If $P O perp alpha$ and $P H perp l$, then $O H perp l$.
  3. If $P H perp l, O H perp l$, and $P O perp O H$, then $P O perp alpha$.
]

#space-plot(
  x-domain: (0, 4),
  y-domain: (0, 4),
  z-domain: (0, 3),
  x-label: $x$,
  y-label: $y$,
  z-label: $z$,
  view: (x: -90deg, y: -100deg, z: 0deg),
  {
    import cetz.draw: *

    // Define points
    let O = (2, 2, 0)
    let P = (2, 2, 2.5)
    let H = (2, 0.5, 0)

    // Draw plane alpha (xy-plane region)
    rect((0, 0, 0), (4, 4, 0), fill: blue.transparentize(90%), stroke: none)
    content((3.5, 3.5, 0), $alpha$)

    // Draw line l on plane alpha
    line((0, 0.5, 0), (4, 0.5, 0), stroke: (paint: active-theme.text-heading, thickness: 1pt), name: "l")
    content((4.2, 0.5, 0), $l$)

    // Draw perpendiculars
    line(P, O, stroke: (paint: red, dash: "dashed"), name: "PO") // PO perp alpha
    line(O, H, stroke: (paint: red, dash: "dashed"), name: "OH") // OH perp l
    line(P, H, stroke: (paint: red, thickness: 1.2pt), name: "PH") // PH perp l (result)

    // Draw points
    circle(O, radius: 0.05, fill: black)
    content(O, $O$, anchor: "north-west", padding: 0.1)

    circle(P, radius: 0.05, fill: black)
    content(P, $P$, anchor: "south", padding: 0.1)

    circle(H, radius: 0.05, fill: black)
    content(H, $H$, anchor: "north", padding: 0.1)

    // Right angle markers
    // PO perp OH (since PO perp alpha)
    line((2, 2, 0.3), (2, 1.7, 0.3), (2, 1.7, 0), stroke: 0.5pt)

    // OH perp l
    line((2.3, 0.5, 0), (2.3, 0.8, 0), (2, 0.8, 0), stroke: 0.5pt)

    // PH perp l (the theorem result)
    line((2.3, 0.5, 0), (2.3, 0.65, 0.3), (2, 0.65, 0.3), stroke: (paint: red, thickness: 0.5pt))
  },
)

#example("Cuboid")[
  Consider a cuboid with vertices at coordinates $(x, y, z)$ where $x in {0, 2}, y in {0, 3}, z in {0, 4}$.
  Let $A(0, 0, 0)$ and $G(2, 3, 4)$ be opposite vertices.
  Find the distance from vertex $A$ to the diagonal $B D$ on the face $z=0$, where $B(2, 0, 0)$ and $D(0, 3, 0)$.

  #solution("")[
    The points are $A(0, 0, 0)$, $B(2, 0, 0)$, and $D(0, 3, 0)$.
    The line segment $B D$ lies in the $x y$-plane ($z=0$).
    The vector $vec(B D) = D - B = #sym.chevron.l -2, 3, 0 #sym.chevron.r$.
    The line equation passing through $B$ and $D$ in the $x y$-plane is:
    $ (x - 2)/(-2) = (y - 0)/3 arrow.r.double 3x - 6 = -2y arrow.r.double 3x + 2y - 6 = 0. $

    The distance from $A(0, 0, 0)$ to the line $3x + 2y - 6 = 0$ (in 2D) is:
    $ d = abs(3(0) + 2(0) - 6) / sqrt(3^2 + 2^2) = abs(-6) / sqrt(9 + 4) = 6 / sqrt(13). $

    Alternatively, using the cross product area formula for triangle $A B D$:
    Area of $triangle A B D = 1/2 norm(vec(A B) times vec(A D))$.
    $vec(A B) = #sym.chevron.l 2, 0, 0 #sym.chevron.r$, $vec(A D) = #sym.chevron.l 0, 3, 0 #sym.chevron.r$.
    $vec(A B) times vec(A D) = #sym.chevron.l 0, 0, 6 #sym.chevron.r$.
    Area $= 1/2 (6) = 3$.
    Base $B D = norm(vec(B D)) = sqrt((-2)^2 + 3^2) = sqrt(13)$.
    Height $h = (2 times "Area") / "Base" = 6 / sqrt(13)$.
  ]
]

= Projections in 3D

Projection of figure $F$ onto plane $alpha$.
Area of projected $S'$ is Area of $S$ times $cos theta$.

#example("Tetrahedron")[
  Let $O(0,0,0), A(3,0,0), B(0,3,0), C(0,0,3)$ be vertices of a tetrahedron.
  Find the area of the face $A B C$.

  #solution("")[
    The area of triangle $A B C$ is given by $1/2 norm(vec(A B) times vec(A C))$.
    $ vec(A B) = B - A = #sym.chevron.l -3, 3, 0 #sym.chevron.r $
    $ vec(A C) = C - A = #sym.chevron.l -3, 0, 3 #sym.chevron.r $

    Calculate the cross product:
    $
      vec(A B) times vec(A C) & = det(mat(i, j, k; -3, 3, 0; -3, 0, 3)) \
                              & = i(9 - 0) - j(-9 - 0) + k(0 - (-9)) \
                              & = 9i + 9j + 9k = #sym.chevron.l 9, 9, 9 #sym.chevron.r
    $

    The magnitude is:
    $ norm(vec(A B) times vec(A C)) = sqrt(9^2 + 9^2 + 9^2) = sqrt(3 dot 81) = 9sqrt(3). $

    Therefore, the area is:
    $ "Area" = 1/2 (9sqrt(3)) = (9sqrt(3))/2. $
  ]
]

= Distance Formulas

- Point to Plane: $d = abs(a x_0 + b y_0 + c z_0 - d) / sqrt(a^2 + b^2 + c^2)$.
- Point to Line: $d = norm(vec(A P) times v) / norm(v)$ (or using projection).
- Skew Lines: $d = abs((p_1 - p_2) dot (m_1 times m_2)) / norm(m_1 times m_2)$.

#example("Distance Point-Plane")[
  Find the distance between the point $P(1, 2, 3)$ and the plane $x - 2y + 3z = 1$.

  #solution("")[
    The distance $D$ from a point $P_0(x_0, y_0, z_0)$ to the plane $a x + b y + c z + d = 0$ is given by:
    $ D = abs(a x_0 + b y_0 + c z_0 + d) / sqrt(a^2 + b^2 + c^2). $

    Rewrite the plane equation as $x - 2y + 3z - 1 = 0$.
    Here, $a = 1, b = -2, c = 3, d = -1$.
    $x_0 = 1, y_0 = 2, z_0 = 3$.

    $
      D & = abs(1(1) + (-2)(2) + 3(3) - 1) / sqrt(1^2 + (-2)^2 + 3^2) \
        & = abs(1 - 4 + 9 - 1) / sqrt(1 + 4 + 9) \
        & = abs(5) / sqrt(14) = 5/sqrt(14).
    $
  ]
]

#example("Distance Skew Lines")[
  Find the distance between the skew lines:
  $ l_1: x = 1 + t, y = t, z = 0 $
  $ l_2: x = 0, y = 1 + s, z = s $

  #solution("")[
    Identify a point and direction vector for each line:
    Line $l_1$: Point $P_1(1, 0, 0)$, Direction $v_1 = #sym.chevron.l 1, 1, 0 #sym.chevron.r$.
    Line $l_2$: Point $P_2(0, 1, 0)$, Direction $v_2 = #sym.chevron.l 0, 1, 1 #sym.chevron.r$.

    The distance $d$ between skew lines is given by the projection of the vector connecting the points onto the normal vector of the parallel planes containing the lines.
    $ d = abs(vec(P_1 P_2) dot (v_1 times v_2)) / norm(v_1 times v_2). $

    1. Calculate $vec(P_1 P_2) = P_2 - P_1 = #sym.chevron.l -1, 1, 0 #sym.chevron.r$.
    2. Calculate cross product $n = v_1 times v_2$:
      $ n = det(mat(i, j, k; 1, 1, 0; 0, 1, 1)) = i(1) - j(1) + k(1) = #sym.chevron.l 1, -1, 1 #sym.chevron.r. $
    3. Calculate dot product:
      $ vec(P_1 P_2) dot n = (-1)(1) + (1)(-1) + (0)(1) = -1 - 1 = -2. $
    4. Calculate magnitude of normal:
      $ norm(n) = sqrt(1^2 + (-1)^2 + 1^2) = sqrt(3). $

    Distance:
    $ d = abs(-2) / sqrt(3) = 2/sqrt(3) = (2sqrt(3))/3. $
  ]
]
