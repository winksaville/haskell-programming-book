module GivenTypeWriteFunction where

-- 1) This is the identity function
i :: a -> a
i x = x

-- 2) Hmm there seems to be 2 versions that work
c :: a -> b -> a
c x _ = x
--c x y = x

-- 3) Yes c and c'' are equivalent
c'' :: b -> a -> b
c'' x _ = x

-- 4) this return the second parameter
c' :: a -> b -> b
c' _ y = y

-- 5) tail
rt :: [a] -> [a]
rt [] = []
rt (x:xs) = xs

--    init
ri :: [a] -> [a]
ri [] = []
ri (x:[]) = []
ri (x:xs) = x:(ri xs)

--    first as array
rf :: [a] -> [a]
rf [] = []
rf (x:_) = [x]

-- Functions for use in testing and helping to understand 6, 7 and 8
-- which I initially didn't know how to answer.
f_aToB :: (Ord a, Num a) => a -> Bool
f_aToB a = if a >= 0 then True else False

f_aToC :: a -> String
f_aToC _ = "aToC"

f_bToC :: Bool -> String
f_bToC b = if b then "b is True" else "b is False"


-- 6)
co :: (b -> c) -> (a -> b) -> a -> c
co bToC aToB a = bToC (aToB a)

coResult = co f_bToC f_aToB 0

-- 7) first parameter is ignored
a :: (a -> c) -> a -> a
a _ x = x

aResult = a f_aToC 123

-- 8)
a' :: (a -> b) -> a -> b
a' aToB a = aToB a

a'Result = a' f_aToB (-1)
