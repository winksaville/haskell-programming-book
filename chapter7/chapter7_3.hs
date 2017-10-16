module Chaoter7_3 where

-- 1. All are the same and the types are the same
-- mThx :: Num a => a -> a -> a-> a
mTh1 x y z = x * y * z
mTh2 x y = \z -> x * y * z
mTh3 x = \y -> \z -> x * y * z

-- But for some reason with the ghci 8.2 the type for mTh4 is:
-- mTh4 :: Integer -> Integer -> Integer -> Integer
mTh4 = \x -> \y -> \z -> x * y * z

-- But this works as you'd expect, WHY is this not the type
mTh4' :: Num a => a -> a -> a -> a
mTh4' = \x -> \y -> \z -> x * y * z

-- 2. Answer d Num a => a -> a-> a

-- 3.a
addOneIfOdd n = case odd n of
    True -> f n
    False -> n
    where f = \n -> n + 1

-- 3.b
--addFive x y = (if x > y then y else x) + 5
addFive = \x -> \y -> (if x > y then y else x) + 5

-- 3.c
--mflip f = \x -> \y -> f y x
mflip f x y = f y x

