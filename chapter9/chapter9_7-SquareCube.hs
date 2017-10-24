module SquareCube where

mySqr = [x^2 | x <- [1..5]]
myCube = [x^3 | x <- [1..5]]


-- 1.
mySc = [(x, y) | x <- mySqr, y <- myCube]

-- 2.
mySc' = [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]

-- 3.
myCount xs = length xs
