#import "../../templates/templater.typ":*

= Introduction : What is statistics?
Descriptive statistics shows the correlation of a model with the actual world. In contrast to the probability we learned earlier, which "predicts" the possibility of an event happening, statistics "analyzes" an happened event, organizing and categorizing the data to find meaningful trends.

#definition("Descriptive Statistics")[
  *Descriptive statistics* is the field of statistics that analyzes and organizes data. 
]
#definition("Inferential Statistics")[
  *Analytical statistics* is the field of statistics that looks at an organized dataset to find meaningful trends. 
]

== Basic Terminology
#definition("Mean")[
  An *average/mean* from an sample is the sum of the elements of the sample divided by the number of samples. 
  
]
#definition("Variance")[
  A *variance* is the number representing how "spread" the data is. It is calculated as the average of the square of the difference of each sample to the mean. 

  \* A *standard deviation* is calculated by the root of variance. 
]

#definition("Median")[
  A *median* is the value in the middle of the sorted data. It can either be the $(n+1)/2$th value in $n=2k$, or the average of the $(n)/2$th element and the $(n)/2+1$th element if n=2k+1. 
]

#definition("Mode")[
  A *mode* shows the element with the most shows inside of a dataset. 
]

#definition("Quartiles")[
  - *First Quartile(Q1)*
    - the median of the lower 50%.
  - *Third Quartile(Q3)*
    - The median of the upper 50%. 
  - The second quartile is equal to the global median. 
]

#definition("Five-number Summary")[
  $ "min" --- "Q1" --- "median(Q2)" --- "Q3" --- "max" $
  Here, the difference between each region($---$) is called the *IQR(Interquartile range)* 
  
  The larger the IQR, the more widespread the data is. 
  
  Using this, we can define a thing called a box plot. \ \ 
  #align(center)[
    #image("../images/boxplot.png", width: 7cm) 
    Example of a box plot. 
  ] \
]

= The Central Limit Theorem

Say we nave $n$ "random generators" which spit out a number in the range $[0,1]$. Here, if we add multiple vaiables together, the probability of each number to appear will slowly take on a bell-shaped curve. Why is this?
#theorem("The Central Limit Theorem")[
  If $X ~  B(n,p)$, and $n$ is sufficiently large, 
  $P(a lt.eq X lt.eq b)$ is equal to the area under the graph :  
  $ y = f(x) = 1/(sqrt(2 pi) sigma) e ^ (-1/(2 sigma ^2)(x-mu)^2) $ 
  The *central limit theorem* states that the 
  more random variables are merged, the closer the probability above approaches the area under the graph.  
  
]

#definition("Normal Random Variable")[
  If a random variable $Y$ satisfies the property $ P(a lt.eq Y lt.eq b) = ("the area under"   y = f(x) = 1/(sqrt(2 pi) sigma) e ^ (-1/(2 sigma ^2)(x-mu)^2)) $
  then $Y$ is called a *normal random variable* or a *Gaussian* variable whith mean $mu$ and variance $sigma^2$.

  Then, we write $Y$ as
  $ Y ~ N(mu, sigma^2) $
]

#note("Remark")[
  If $Y ~ N(mu, sigma^2)$ then $ a Y + b ~ N(a mu + b, a^2 sigma^2) $
]

#definition("Normalization")[
  If we subtract from $Y$ $mu$ and divide by $sigma$, we get a normal distribution of $N(0,1)$. We call this normalized distribution a *standard normal distribution*. 
]


#example("Coin toss")[
  Let $X$ be the number of heads among 80 coin tosses. 
  
 \ Q1. Express X as a normal distribution. 
  #solution()[
    $ X~B(80, 1/2) approx N(80 times 1/2 , 80 times 1/2 times (1-1/2)) = N(40, 20) $
  ]
 \ Q2. Find the probability where $X lt.eq 35$. 
 #solution()[
   $ P(X lt.eq 35) = P((X - 40) / sqrt(20)) lt.eq (35 - 40) / sqrt(20) $
   Here,we can see that $Z = (X-40) / sqrt(20)$ is approximately a standard normal distribution. 
    $ approx P(Z lt.eq -1.118) $
        
    #note("cf")[
      $ P(Z lt.eq n) = Phi(n) $
      This function is called the *Gauss culmitative distribution function*, represented by the equation
      $ y = 1/sqrt(2 pi) e ^ (-x^2 / 2) $
    
      Some notable characteristics include: 
      - $Phi(0) = 1/2$
      - $Phi(x) + Phi(1-x) = 1$
      We can easily calculate this using the $"norm.s.dist"(x)$ function in google spreadsheets. 
    ]

    Continuing from above using this new knowledge, 
    $ approx Phi(-1.118) approx 13.2% $ 
 ]

 \ Q3. Find the probability where $X lt 36$. 
 #solution("",3)[
   $ P(X < 36) = P((X - 40)/sqrt(20) < (36 - 40) / sqrt(20)) approx P(Z < ~~) approx 18.6% $
   #note("limitations of the normal distribution")[
     Binomial distributions are fundamentally discrete random variables. However, since normal distributions are continuous, they will have a few disrepancies similar to the one shown above. Thus, mathematicians use the middle value(35.5 in this case).  
   ]
 ]

 
]


#example("Dice x300")[
  We are going to throw a dice 300 times. Find the probability that we get 61~64 threes. 
  #solution()[
    $ X ~ B(300, 1/6) approx N(300 times 1/6, 300 times 1/6 times 5/6) = N(50,6.455^2) $
    Therefore, 
    $ P(61 lt.eq X lt.eq 64) $
    $ =P((X - 50)/6.455 lt.eq (64 - 50) / 6.455 ) - P((X - 50)/6.455 lt.eq (60  - 50) / 6.455 ) $
    Now that we have reached normality, we can calculate using $Phi$. 
    $ approx Phi(14 / 6.455) - Phi(10/6.455) $
    
  ]
]

#theorem("Empirical Rule")[
  $ Phi(1.282) = 0.9 $  
  $ Phi(1.645) = 0.95 $
  $ Phi(1.960) = 0.975 $
  From this, we can know the following :  
  - Within $plus.minus 1.282 sigma$, 80% of the data exists. 
  - Within$plus.minus 1.645 sigma$, 90% of the data exists. 
  - Within $plus.minus 1.960 sigma$, 95% of the data exists. 
]

#notation($Z$)[
  We write for a $Z_alpha in RR$ such that $Phi(-Z_alpha) = 1-alpha$. We can note that $-Z_alpha = Z_(1-alpha)$
]

#example("The defection rate of a 4nm semiconductor")[
  The defection rate of a 4nm semiconductor at a s\*\*\*ung factory is 40%. 
  
  \ Q1. If we choose a 100 random chips from a pile, describe the distribution of defective chips. 
  #solution()[
    Let $X$ be the number of defective chips. 
    $ X ~ B(100, 0.4) limits(approx)^"CLT" cal(N)(40,100dot 0.4dot 0.6) $
    $ = N(40, 24) $
  ]

  \ Q2. Find $n$ such that $X$ exceeds $n$ with probability 5%. 
  #solution()[
    $ P(X > n) = 0.05 $
    $ P((X - 40) / sqrt(24) > (n - 40) / sqrt(24)) $
    $ = 1 - Phi((n-40) / sqrt(24)) = Z_0.05 approx 1.645 $
    $ therefore n approx 48 $
  ]

  \ Q3. Find integers $a$ and $b$ sich that $P(a.lt.eq X lt.eq b) = 99%$
  #solution("Center is the mean","3-1")[
    The region equals $mu plus.minus sigma times Z_0.005$. Thus, the region is 27 \~ 53. 
  ]
  #solution("A is minimum","3-2")[
    The region equals $0$ to $mu + sigma times Z_0.01$. Thus, the region is 0 \~ 51. 
  ]
  #solution("A is minimum","3-3")[
    The region equals $mu - sigma times z_0.001$ to $100$. Thus, the region is 29 \~ 100. 
  ]
]