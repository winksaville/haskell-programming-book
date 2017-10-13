module MatchTheTypes where

import Data.List

-- 1.a yes works, but "i :: a" doesn't work because to use a literal you must have concrete type
i :: Num a => a
i = 1

-- 1.b doesn't work because to use a literal you must have concrete type
i' :: a
i' = undefined
--i' = 1

-- 2.a Yes 1.0 isa Fractional and Float isa Frational
f :: Float
f = 1.0

-- 2.b yes 1.0 isa Num. (WRONG not sure why)
--f' :: Num a => a
--f' = 1.0

-- 3.b yes
f'' :: Fractional a => a
f'' = 1.0

-- 4.b yes
f''' :: RealFrac a => a
f''' = 1.0

-- 5.a yes Identity function
freud :: a -> a
freud x = x

-- 5.b no not every a is Ord (WRONG not sure why)
freudOrd :: Ord a => a -> a
freudOrd x = x

-- 6.b typechecks and (freud' 1) words but as expected (freud' 1.0) fails as 1.0 isn't Int
freud' :: Int -> Int
freud' x = x

-- 7.a Yes, always returns 1
myX = 1 :: Int
sigmund :: Int -> Int
sigmund x = myX

-- 7.b Yes (WRONG grrr)
--sigmund' :: a -> a
--sigmund' x = myX

-- 8.b Yes (WRONG :( )
--sigmund'' :: Num a => a -> a
--sigmund'' x = myX

-- 9.a Yes min of a list
jung :: Ord a => [a] -> a
jung xs = head (sort xs)

-- 9.b Yes as Int has an instance Ord and Equ
jung' :: [Int] -> Int
jung' xs = head (sort xs)

-- 10.a Yes as Char has an intance of Ord and Equ
young :: [Char] -> Char
young xs = head (sort xs)

-- 10.b Yes as xs must be an Ordering
young' :: Ord a => [a] -> a
young' xs = head (sort xs)

-- 11.a Yes
mySort :: [Char] -> [Char]
mySort = sort

signifier :: [Char] -> Char
signifier xs = head (sort xs)

-- 11.b Yes
signifier' :: Ord a => [a] -> a
signifier' xs = head (sort xs)
