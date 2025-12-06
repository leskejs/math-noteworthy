#import "../../templates/templater.typ": *

= Rotation of Conic Sections

$ A x sr + underbrace(B x y, "this rotates\nthe graph") + C y sr + D x +E y +F = 0 $
- The rotation is linear transform.
#rect-plot(
  size: (10, 10),
  x-domain: (-5, 5),
  y-domain: (-5, 5),
  {
    point((2, 4), [$P$], pos: "north")
  },
  draw-content: {
    draw.line((0, 0), (2, 4), name: "r")
    draw.line(
      (-6 * calc.cos(15deg), -6 * calc.sin(15deg)),
      (6 * calc.cos(15deg), 6 * calc.sin(15deg)),
      name: "X",
      stroke: (paint: gray, dash: "dashed"),
      mark: (end: "stealth"),
    )

    draw.line(
      (-6 * calc.cos(15deg + 90deg), -6 * calc.sin(15deg + 90deg)),
      (6 * calc.cos(15deg + 90deg), 6 * calc.sin(15deg + 90deg)),
      name: "Y",
      stroke: (paint: gray, dash: "dashed"),
      mark: (end: "stealth"),
    )

    angle.angle(
      (0, 0),
      (1, 0),
      (1, calc.tan(15deg)),
      label: text(green, [#sym.phi]),
      radius: 1,
      label-radius: 1.5,
      fill: green.transparentize(70%),
    )
    angle.angle(
      (0, 0),
      (1, calc.tan(15deg)),
      (1, calc.tan(calc.atan(2))),
      label: text(blue, [#sym.theta]),
      radius: 0.7,
      label-radius: 1,
      fill: blue.transparentize(70%),
    )

    let thet = calc.atan(2) - 15deg

    draw.line((2, 4), (0, 4), stroke: (paint: yellow, dash: "dashed"), name: "yval")
    draw.line((2, 4), (2, 0), stroke: (paint: yellow, dash: "dashed"), name: "xval")
    draw.line(
      (2, 4),
      (calc.sqrt(20) * calc.cos(thet) * calc.cos(15deg), calc.sqrt(20) * calc.cos(thet) * calc.sin(15deg)),
      stroke: (paint: red, dash: "dashed"),
      name: "Xval",
    )
    draw.line(
      (2, 4),
      (-calc.sqrt(20) * calc.sin(thet) * calc.sin(15deg), calc.sqrt(20) * calc.sin(thet) * calc.cos(15deg)),
      stroke: (paint: red, dash: "dashed"),
      name: "Yval",
    )

    let Xval = (calc.sqrt(20) * calc.cos(thet) * calc.cos(15deg), calc.sqrt(20) * calc.cos(thet) * calc.sin(15deg))
    let Yval = (-calc.sqrt(20) * calc.sin(thet) * calc.sin(15deg), calc.sqrt(20) * calc.sin(thet) * calc.cos(15deg))

    angle.right-angle((2, 0), (2.1, 0), (2, 0.1), radius: 0.3, label: "")
    angle.right-angle((0, 4), (0, 3), (1, 4), radius: 0.3, label: "")
    angle.right-angle(
      Xval,
      (Xval.at(0) + calc.cos(15deg), Xval.at(1) + calc.sin(15deg)),
      (Xval.at(0) - calc.sin(15deg), Xval.at(1) + calc.cos(15deg)),
      radius: 0.3,
      label: "",
    )
    angle.right-angle(
      Yval,
      (Yval.at(0) + calc.cos(15deg), Yval.at(1) + calc.sin(15deg)),
      (Yval.at(0) + calc.sin(15deg), Yval.at(1) - calc.cos(15deg)),
      radius: 0.3,
      label: "",
    )


    // Labels
    draw.content(("r.start", 50%, "r.end"), text()[$ r $], anchor: "west", padding: 0.2)
    draw.content("X.end", text()[$ X $], anchor: "north-east", padding: 0.2)
    draw.content("Y.end", text()[$ Y $], anchor: "west", padding: 0.2)
  },
)

- If the axes $x,y$ are rotated #sym.phi and become $X,Y$
  - For dot $P(x,y)=(r,theta + phi)$
    - In this case, $P(2,3)=(2sqrt(5),theta+phi)$
  - $X=r cos theta$, $Y=r sin theta$
  - $x=r cos (theta + phi)=r cos theta cos phi - r sin theta sin phi=X cos phi - Y sin phi$
  - $y=r sin (theta + phi)=r cos theta sin phi + r sin theta cos phi=X sin phi + Y cos phi$

#equation("Rotation Matrix")[
  As we have shown above,
  $
    bmat(x; y)=bmat(cos phi, -sin phi; sin phi, cos phi)bmat(X; Y) arrow.r.double
    bmat(X; Y)=bmat(cos phi, sin phi; -sin phi, cos phi)bmat(x; y)
  $
  This again ensures that rotating the graph is a linear transform.
]

#example("Rotation of Axis Basics")[
  Consider a function $x y=2$. \
  #rect-plot(
    size: (7, 7),
    x-domain: (-5, 5),
    y-domain: (-5, 5),
    {
      add-graph(x => 2 / x, domain: (-6, -0.1))
      add-graph(x => 2 / x, domain: (6, 0.1))
    },
    draw-content: {
      draw.line(
        (-6 * calc.cos(45deg), -6 * calc.sin(45deg)),
        (6 * calc.cos(45deg), 6 * calc.sin(45deg)),
        name: "X",
        stroke: (paint: gray, dash: "dashed"),
        mark: (end: "stealth"),
      )
      draw.line(
        (-6 * calc.cos(45deg + 90deg), -6 * calc.sin(45deg + 90deg)),
        (6 * calc.cos(45deg + 90deg), 6 * calc.sin(45deg + 90deg)),
        name: "Y",
        stroke: (paint: gray, dash: "dashed"),
        mark: (end: "stealth"),
      )

      angle.angle(
        (0, 0),
        (1, 0),
        (1, calc.tan(45deg)),
        label: text(green, [45#sym.degree]),
        radius: 1,
        label-radius: 1.5,
        fill: green.transparentize(70%),
      )
      draw.content("X.end", text()[$ X $], anchor: "north-east", padding: 0.2)
      draw.content("Y.end", text()[$ Y $], anchor: "north-west", padding: 0.2)
    },
  )
  What is the function represented by this when we rotate this counterclockwise 45#sym.degree?
  #solution("", 1)[
    Consider the rotated axes $X,Y$. \
    We know that
    $ bmat(x; y)=bmat(cos phi, -sin phi; sin phi, cos phi)bmat(X; Y) "where" phi=45degree $
    Using this, $x=X cos phi - Y sin phi$ and $y=X sin phi + Y cos phi$. \
    Plugging in and calculating gives us
    $ therefore 1/4 X sr - 1/4 Y sr = 1 $
  ]
  However, in this case, we were able to end up with simple equation because we can intuitively guess that it must be rotated 45#sym.degree.
]

Is there a way to find rotated angle for any general curve?

\

= General Conic Section

#note("Recap")[
  $ A x sr + underbrace(B x y, "this rotates\nthe graph") + C y sr + D x +E y +F = 0 $
]

How can we remove $x y$ term? By rotational transform! \

#theorem("Generalization of Methodology")[
  For some angle $phi$, \
  rotating by angle of $phi$ will result in canceling out $x y$ term if $cot phi=(A-C)/B$.
  #proof("")[
    #let xval = $X cos phi - Y sin phi$
    #let yval = $X sin phi + Y cos phi$
    Let the rotated coordinates be $X, Y$.\
    Then, we know that $x=X cos phi - Y sin phi$ and $y=X sin phi + Y cos phi$. \
    Plugging in will result in:
    $ A(xval)sr + B(xval)(yval) \ + C(yval)sr + D(xval) + E(yval) + F = 0 $
    The coefficient of $x y$ term here is
    $ -2A cos phi sin phi + B(cos sr phi - sin sr phi) + 2C cos phi sin phi $
    $ = (C-A)underbrace((2cos phi sin phi), =sin 3 phi) + B underbrace((cos sr phi - sin sr phi), =cos 2 phi) $
    Since we're searching $phi$ #st cancels $x y$ terms, let's suppose equation above is 0.
    $ arrow.r.double (C-A)sin 2 phi + B cos 2 phi = 0 $
    $ (C-A)/B=(cos 2 phi)/(sin 2 phi) = cot 2 phi $
    #qed
  ]
]

\ \ \

#example([Finding $phi$])[
  Change $6 sq(3) x sr + 6 x y + 4 sq(3) y sr = 21 sq(3)$ to a standard form of the conic.

  #solution("", 1)[

    #rect-plot(
      size: (6, 6),
      x-domain: (-3, 3),
      y-domain: (-3, 3),
      {
        plot-function(
          (x, y) => 6 * calc.sqrt(3) * x * x + 6 * x * y + 4 * calc.sqrt(3) * y * y - 21 * calc.sqrt(3),
          type: "implicit",
          domain: (-3.2, 3.2),
          y-domain: (-3.2, 3.2),
        )
        add-xy-axes(30deg, 3)
      },
      draw-content: {}, //
    )
  ]
  Suppose XY axes that have been rotated by $phi$ degrees to remove $x y$ terms. \
  We know that $cot 2 phi = (A-C)/B = (6sq(3)-3sq(3))/6=sq(3)/2$. \
  Then we can imply that $2 phi = 60 degree arrow.r.double phi = 30 degree$. \
  Thus,
  $ x=X cos phi - Y sin phi = sq(3)/2 X - 1/2 Y " and " X sin phi + Y cos phi = 1/2 X + sq(3)/2 Y $
  #let xval = $X cos phi - Y sin phi$
  #let yval = $X sin phi + Y cos phi$
  Plugging in gives us
  $ 6 sq(3) (xval) sr + 6(xval)(yval) \ + 4 sq(3) (yval) sr = 21 sq(3) $
  $ arrow.r.double 7 sq(3) X sr + s sq(3) Y sr = 21 sq(3) arrow.r.double (X sr)/3 + (Y sr)/7=1 $
]

\

#example([Finding $phi$ where it is not a trigonomical special angle])[
  $ 64 x sr + 96 x y + 36 y sr - 15 x + 20 y - 25 = 0 $
  Remove the $xy$ term by rotating the graph. \ \ \ \

  #solution("", 1)[

    #rect-plot(
      size: (6, 6),
      x-domain: (-1.5, 1.5),
      y-domain: (-1.5, 1.5),
      x-tick: 0.5,
      y-tick: 0.5,
      {
        plot-function(
          (x, y) => 64 * x * x + 96 * x * y + 36 * y * y - 15 * x + 20 * y - 25,
          type: "implicit",
          domain: (-1.6, 1.6),
          y-domain: (-1.6, 1.6),
          samples: 300,
        )
        add-xy-axes(calc.atan(3 / 4), 1.5)
      },
      draw-content: {},
    )
    Suppose XY axes that have been rotated by $phi$ degree to remove $x y$ term. \
    Then we know that $cot 2 phi = (A-C)/B = (64-36)/96=7/24$. \
    #align(center)[
      #canvas({
        import cetz.angle
        draw.line((0, 0), (-2.4, 0), (0, 0.7), close: true, stroke: (paint: active-theme.plot.highlight), name: "tr")
        angle.angle(
          (0, 0.7),
          (0, 0),
          (-2.4, 0.7),
          label: text(size: 8pt, green)[2$phi$],
          radius: 0.15,
          label-radius: 0.33,
          fill: green.transparentize(70%),
          stroke: active-theme.plot.stroke,
        )
        angle.right-angle(
          (0, 0),
          (0, 0.3),
          (-0.3, 0),
          radius: 0.2,
          stroke: active-theme.plot.stroke,
        )

        draw.content((-1.2, 0), [24], anchor: "north", padding: 0.1)
        draw.content((0, 0.35), [7], anchor: "west", padding: 0.1)
        draw.content((-1.2, 0.35), [25], anchor: "south", padding: 0.1)
        draw.content((2.4, 0.35), [$because sq(24 sr + 7 sr)=25$])
      })
    ]
    By drawing the triangle, we can obtain $cos 2 phi = 7/25.$\
    Using the half angle formulae from Mathematics I,
    $ cos phi = sq((1 + cos 2 phi)/2) = sq((1+ 7/25)/2)=sq(((25+7)/25)/2)=sq(16/25)=4/5 $
    $ sin phi = sq((1 - cos 2 phi)/2) = sq((1- 7/25)/2)=sq(((25-7)/25)/2)=sq(9/25)=3/5 $
    Thus,
    $ x = X cos phi - Y sin phi = 4/5X-3/5Y "and" y = X sin phi + Y cos phi = 3/5X+4/5Y $
    Plugging in,
    #let xval = $4/5X-3/5Y$
    #let yval = $3/5X+4/5Y$
    $ 64(xval)^2 + 96(xval)(yval) + 36(yval)^2 \ -15(xval) + 20(yval) -25 = 0 $
    After more calculations,
    $ therefore 100X sr + 25 Y - 25 = 0 $
  ]
]

// 여기 원래 있던 example 뭔가 왜 있는지 모르겠고 애매해서 걍 생략함.

= Determining the Type of Conic Section via General Formula

#note("Recap")[
  $ A x sr + B xy + y sr + D x + E y + F = 0 $
]

#analysis("Seeking Approach")[
  - Since we know the translation, we know that \ $exists p,q in RR #st A(x-p)sr + B(x-p)(x-q) + C(y-q)sr + F'$ \ can be obtained using translation without change in the type of conic section.
  - Thus, we can imply that we can only focus at $A,B,C$.
]

#theorem("Identification of conics")[
  Let $A x sr + B xy + y sr + D x + E y + F = 0$ be a non-degenerate conic section. \
  Then, the type of the conics can be determined by discriminant $Delta = B sr - 4A C$:
  $ cases(B sr - 4A C < 0:" Ellipse", B sr - 4A C = 0:" Parabola", B sr - 4A C < 0:" Hyperbola") $
  #proof("Textbook Approach")[
    Let an equation of a graph rotated $phi$ degree be
    $ A'X sr + B'X Y + C'Y sr + D'X + E'Y + F'=0 $
    Knowing that $x = X cos phi - Y sin phi$ and $y = X sin phi + Y cos phi$, \
    We can show via calculation (comparing coefficient of each sides) that
    $ B sr - 4 A C = B'sr - 4A'C' $
    Let's suppose $phi$ that removes the XY term. \
    That case, The discriminant will be $Delta'=-4A'C'$. \
    We already know how to determine the type when there are no XY term. \
    Using that methodology, we can easily show that the theorem holds for $Delta'$. \
    Since $Delta = Delta'$, we can conclude that the theorem is true.
    #qed
  ]
  #proof("Linear Algebra Aproach")[
    Like we have shown on the analysis, first degree terms aren't important, so let's omit them.
    Let's utilize matrices. For rotated equation $A'X sr +C'Y sr$ that lost the XY term,
    $
      A x sr + B xy + C y sr = bmat(x, y) bmat(A, B/2; B/2, C) bmat(x; y) = A'X sr + C'Y sr = bmat(X, Y) bmat(A', 0; 0, C')bmat(X; Y)" "dots.c" "(*)
    $
    #notation("Rotation Matrix")[
      Let the rotation matrix that rotates the graph with $phi$ amount be
      $ R_phi = bmat(cos phi, -sin phi; sin phi, cos phi) $
      $ "So that " bmat(x; y)=R_phi bmat(X; Y) $
    ]
    #analysis("Properties of Rotation Matirx")[
      Let's think the rotation as a linear transform $f_phi: RR sr -> RR sr$. \
      Then, obviously $[f_phi]=R_phi$. \
      Intuitively, rotating $phi$ amount then $-phi$ amount will result in original state.
      $ f_phi (f_(-phi)(bmat(x; y))) = f_(-phi) (f_(phi)(bmat(x; y))) = bmat(x; y) $
      $ arrow.r.double R_phi R_(-phi) bmat(x; y) = R_(-phi)R_phi bmat(x; y) = bmat(x; y) $
      $ therefore R_phi invs = R_(-phi) $
      Let's think of a transpose of $R_phi$:
      $
        R_phi^T = bmat(cos phi, -sin phi; sin phi, cos phi)^T=bmat(cos phi, sin phi; -sin phi, cos phi)=bmat(cos(-phi), -sin(-phi); sin(-phi), cos(-phi))=R_(-phi)
      $
      $ therefore R_phi invs = R_phi^T = R_(-phi) $
    ]
    We know, from above notation and analysis,
    $ bmat(x; y)=R_phi bmat(X; Y) "and" bmat(x, y)=bmat(X, Y)R_phi^T = bmat(X, Y)R_phi invs $
    $
      arrow.r.double (*)=bmat(X, Y)R_phi invs bmat(A, B/2; B/2, C)R_phi bmat(x; y) arrow.r.double R_phi invs bmat(A, B/2; B/2, C)R_phi=bmat(A', 0; 0, C')
    $
    $
      arrow.r.double det(R_phi invs bmat(A, B/2; B/2, C)R_phi) = cancel(det(R_phi R_phi invs))det(bmat(A, B/2; B/2, C)) = det(bmat(A', 0; 0, C'))
    $
    $ arrow.r.double A C - (B sr)/4=A'C' arrow.r.double B sr - 4A C = -4A'C' \ therefore Delta = Delta' $
    Next procedures are same as the textbook proof.
  ]
]

#note("Trick for finding A',C'")[
  Using the concepts introduced on linear algebra proof, we can find A',C' of rotated equation without XY term at ease without using trigonometries. \
  $ bmat(A-lambda, B/2; B/2, A-lambda) $
  Two $lambda$ that makes the determinant of above matrix 0 is each A' and C'.
  \ \
  The proof exceeds the bound of precalculus, involving linear algebra concepts.
]
