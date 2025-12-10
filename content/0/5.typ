#import "../../templates/templater.typ": *

= The Dot & Cross Product

= The Dot Product of Vectors

#definition("Dot Product")[
  If $u = #sym.chevron.l a_1, a_2 #sym.chevron.r$ and $v = #sym.chevron.l b_1, b_2 #sym.chevron.r$ are vectors, then their dot product (내적), denoted by $u dot v$, is defined by
  $ u dot v = a_1 b_1 + a_2 b_2. $
]

#example("Calculation")[
  Let $u = #sym.chevron.l 3, -2 #sym.chevron.r$ and $v = #sym.chevron.l 4, 5 #sym.chevron.r$. Find $u dot v$.
  #solution("")[
    Using the definition of the dot product:
    $ u dot v = (3)(4) + (-2)(5) = 12 - 10 = 2. $
  ]
]

#theorem("Properties of the Dot Product")[
  Let $u, v, w$ be vectors and $c$ be a scalar.
  1. $u dot v = v dot u$
  2. $(c u) dot v = c(u dot v) = u dot (c v)$
  3. $(u + v) dot w = u dot w + v dot w$
  4. $norm(u)^2 = u dot u$
]

#example("Exercise")[
  Prove parts 1, 2 and 3 of the properties of the dot product.

  #solution("")[
    Let $u = #sym.chevron.l u_1, u_2 #sym.chevron.r, v = #sym.chevron.l v_1, v_2 #sym.chevron.r, w = #sym.chevron.l w_1, w_2 #sym.chevron.r$ and $c$ be a scalar.

    *Property 1:* $u dot v = v dot u$
    $ u dot v = u_1 v_1 + u_2 v_2 = v_1 u_1 + v_2 u_2 = v dot u. $

    *Property 2:* $(c u) dot v = c(u dot v) = u dot (c v)$
    $
      (c u) dot v = #sym.chevron.l c u_1, c u_2 #sym.chevron.r dot #sym.chevron.l v_1, v_2 #sym.chevron.r = c u_1 v_1 + c u_2 v_2 = c(u_1 v_1 + u_2 v_2) = c(u dot v).
    $
    Similarly, $u dot (c v) = u_1(c v_1) + u_2(c v_2) = c(u_1 v_1 + u_2 v_2) = c(u dot v)$.

    *Property 3:* $(u + v) dot w = u dot w + v dot w$
    $
      (u + v) dot w & = #sym.chevron.l u_1 + v_1, u_2 + v_2 #sym.chevron.r dot #sym.chevron.l w_1, w_2 #sym.chevron.r \
                    & = (u_1 + v_1)w_1 + (u_2 + v_2)w_2 \
                    & = u_1 w_1 + v_1 w_1 + u_2 w_2 + v_2 w_2 \
                    & = (u_1 w_1 + u_2 w_2) + (v_1 w_1 + v_2 w_2) \
                    & = u dot w + v dot w.
    $
  ]
]

#example("Identity")[
  Show that $norm(a plus.minus b)^2 = norm(a)^2 + norm(b)^2 plus.minus 2a dot b$.

  #solution("")[
    Using the property $norm(u)^2 = u dot u$ and the distributive laws:
    $
      norm(a plus.minus b)^2 & = (a plus.minus b) dot (a plus.minus b) \
                             & = a dot a plus.minus a dot b plus.minus b dot a + b dot b \
                             & = norm(a)^2 plus.minus 2(a dot b) + norm(b)^2 \
                             & = norm(a)^2 + norm(b)^2 plus.minus 2a dot b.
    $
  ]
]

#theorem("The Dot Product Theorem")[
  If $theta$ is the angle between two nonzero vectors $u$ and $v$, then
  $ u dot v = norm(u) norm(v) cos theta. $
]

#example("Calculation")[
  Let $norm(b) = 1$ and $norm(a - 3b) = sqrt(13)$. If the angle between $a$ and $b$ is $60^degree$, find $norm(a)$.

  #solution("")[
    $norm(a - 3b)^2 = 13 arrow.r.double norm(a)^2 - 6a dot b + 9norm(b)^2 = 13$
    $norm(a)^2 - 6norm(a) cos 60^degree + 9 = 13$
    $norm(a)^2 - 3norm(a) - 4 = 0 arrow.r.double norm(a) = 4$.
  ]
]

#definition("Orthogonal")[
  Two nonzero vectors $u$ and $v$ are called *perpendicular*, or *orthogonal* (수직, 직교), if the angle between them is $pi/2$, which implies $u dot v = 0$.
]

#example("Angle Calculation")[
  Find $u dot v$ and $cos theta$.
  (a) $u = #sym.chevron.l 1, 1 #sym.chevron.r, v = #sym.chevron.l 1, -2 #sym.chevron.r$
  (b) $u = #sym.chevron.l 3, 1 #sym.chevron.r, v = #sym.chevron.l 1, -1 #sym.chevron.r$

  #solution("")[
    The cosine of the angle is given by $cos theta = (u dot v) / (norm(u) norm(v))$.

    (a)
    $ u dot v = 1(1) + 1(-2) = -1 $
    $ norm(u) = sqrt(1^2 + 1^2) = sqrt(2), quad norm(v) = sqrt(1^2 + (-2)^2) = sqrt(5) $
    $ cos theta = (-1) / (sqrt(2) sqrt(5)) = -1/sqrt(10). $

    (b)
    $ u dot v = 3(1) + 1(-1) = 2 $
    $ norm(u) = sqrt(3^2 + 1^2) = sqrt(10), quad norm(v) = sqrt(1^2 + (-1)^2) = sqrt(2) $
    $ cos theta = 2 / (sqrt(10) sqrt(2)) = 2 / sqrt(20) = 2 / (2sqrt(5)) = 1/sqrt(5). $
  ]
]

#example("Recursive Sequence")[
  Let $a, b$ be two perpendicular unit vectors. Define $b_n$ recursively. Find $cos theta$ where $theta = sum theta_n$.
  #solution("")[
    $cos theta = 0$.
  ]
]

= The Component of u along v

$ op("comp")_v u = norm(u) cos theta = (u dot v) / (norm(v)) $
$ op("proj")_v u = ((u dot v) / (v dot v)) v $

#example("Projection")[
  Let $u = #sym.chevron.l -2, 9 #sym.chevron.r$ and $v = #sym.chevron.l -1, 2 #sym.chevron.r$. Find $op("proj")_v u$.
  #solution("")[
    #rect-plot(
      x-domain: (-9, 0),
      y-domain: (0, 9),
      {
        point((0, 0), [$O$])
      },
      draw-content: {
        draw-vec-proj(
          origin: (0, 0),
          (-2, 9),
          (-1, 2),
          label-a: $u$,
          label-b: $v$,
          label-proj: $op("proj")_v u"           "$,
          theme: active-theme,
        )
      },
    )
    $op("proj")_v u = 20/5 #sym.chevron.l -1, 2 #sym.chevron.r = #sym.chevron.l -4, 8 #sym.chevron.r$.
  ]
]

#example("Work")[
  A child pulls a wagon with force 100 N at $60^degree$ for 100 m. Find the work done.

  #solution("")[
    The work done $W$ by a constant force $F$ moving an object through a displacement $D$ is given by $W = F dot D = norm(F) norm(D) cos theta$.
    Given: $norm(F) = 100$ N, $norm(D) = 100$ m, $theta = 60^degree$.

    $ W = 100 dot 100 dot cos(60^degree) = 10000 dot 1/2 = 5000 "J (Joules)". $
  ]
]



#example("Normalize")[
  Normalize (a) $#sym.chevron.l 1, -2, 2 #sym.chevron.r$ (b) $#sym.chevron.l 4, 1, -2 #sym.chevron.r$.
  #solution("")[
    (a) $1/3 #sym.chevron.l 1, -2, 2 #sym.chevron.r$
    (b) $1/sqrt(21) #sym.chevron.l 4, 1, -2 #sym.chevron.r$
  ]
]

#example("Internal Division")[
  Let $A$ and $B$ be two points with position vectors $vec(O A) = a$ and $vec(O B) = b$.
  Find the position vector $p$ of the point $P$ that divides the segment $A B$ internally in the ratio $m:n$.

  #solution("")[
    Since $P$ divides $A B$ in the ratio $m:n$, we have
    $ vec(A P) : vec(P B) = m : n arrow.r.double n vec(A P) = m vec(P B). $
    Expressing these in terms of position vectors:
    $ n(p - a) = m(b - p) $
    $ n p - n a = m b - m p $
    $ (m + n)p = m b + n a $
    $ p = (m b + n a) / (m + n). $
  ]
]
