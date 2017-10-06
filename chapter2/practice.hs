--module Practice where

mult1 = x * y
    where x = 5
          y = 6

p1 = x * 3 + y
    where x = 3
          y = 1000

p2 = x * 5
    where y = 10
          x = 10 * 5 + y

p3 = z / x + y
    where x = 7
          y = negate x
          z = y * 10
