module MoreBottoms where

import Data.Bool (bool)

--1. Bottoms as it needs one value but that first value is undefined
--2. Works return 2
--3. No needs two values but second value in the list is undefined
--4. Returns array of booleans defining where each letter in xs is
--   a vowel or not
--itIsMystery [a] -> (Char -> Bool) -> [Bool] WRONG
itIsMystery :: [Char] -> [Bool]
itIsMystery xs = map (\x -> elem x "aeiou") xs

--5.a map (^2) [1..10]
-- [1,4,9,16,25,36,49,64,81,100]

--5.b map minimum [[1..10], [10..20], [20..30]]
-- [1, 10, 20]

--5.c map sum [[1..5], [1..5], [1..5]]
--[15, 15, 15]

-- 6 use bool instead of if then else
xx = map (\x -> bool x (-x) (x == 3)) [1..10]

