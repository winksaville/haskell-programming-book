module Exercises where

import Data.Char

--1.
-- isUpper :: Char -> Bool
-- toUpper :: Char -> Char

--2. I've choosen to use pointfree
filterUpper :: String -> String
filterUpper = filter isUpper

--3. Caps
cap :: String -> String
cap (x:xs) = toUpper x : xs

--4. Capitalize All
capAll :: String -> String
capAll [] = []
capAll (x:xs) = toUpper x : capAll xs

--5. First letter as Cap 
firstLetter :: String -> Char
firstLetter s = toUpper $ head s
firstLetter' s = (toUpper . head) s -- Composed
firstLetter'' = toUpper . head -- Point free

--6. Create caesar and unCaesar cipher pair
encodeChar :: Char -> Int -> Char
encodeChar c n = chr (mod ((ord c) + n) 256)

caesar :: String -> String
caesar = map (\x -> (encodeChar x 3))

unCaesar :: String -> String
unCaesar = map (\x -> (encodeChar x (-3)))

-- Standard funcs recursive

--1.
myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = x || myOr xs

--2.
myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny f (x:xs) = f x || myAny f xs

--3.
myElem :: Eq a => a -> [a] -> Bool
myElem _ [] = False
myElem a (x:xs) = (x == a) || myElem a xs

-- do more later
