module Exercsies where

-- 1. d)
-- 2. b) gf below
g :: String -> [String]
g = undefined

f :: Char -> String
f = undefined

gf :: Char -> [String]
gf = g . f

-- 3. d) f2 below
f1 :: Ord a => a -> a -> Bool
f1 = undefined

f2 :: (Num a, Ord a) => a -> Bool
f2 x = f1 0 x

-- 4. b
-- 5. a) since we've applied True to f' the resulting type is Bool
f' :: a -> a
f' x = x

-- Write code
-- 1.
tensDigit :: Integral a => a -> a
tensDigit x = d
    where xLast = abs x `div` 10
          d = xLast `rem` 10

-- 1.a)
tensDigitDivMod :: Integral a => a -> a
--tensDigitDivMod x = mod (fst (divMod x 10)) 10
tensDigitDivMod x = d
    where (d1, _) = divMod (abs x) 10
          (_, d) = divMod d1 10
-- 1.b) yes

-- 1.c)
hunsDigit :: Integral a => a -> a
--hunsDigit x = tensDigit ((abs x) `div` 10)
hunsDigit x = tensDigit $ abs x `div` 10

-- Four styles
-- 2. Case
foldBool1 :: a -> a -> Bool -> a
foldBool1 x y b = case b of
    True -> x
    False -> y

-- 2. Guards
foldBool2 :: a -> a -> Bool -> a
foldBool2 x y b
    | True = x
    | otherwise = y

-- 2. Pattern
foldBool3 :: a -> a -> Bool -> a
foldBool3 x _ True = x
foldBool3 _ y False = y

-- 2. If else
foldBool4 :: a -> a -> Bool -> a
foldBool4 x y b = if b then x else y

-- 3.
g' :: (a -> b) -> (a, c) -> (b, c)
g' fn (x, y) = ((fn x), y)

-- 4.
roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

-- 5. Point free version
roundTripPF :: (Show a, Read a) => a -> a
roundTripPF = read . show

-- 6. Error I don't know how to "force" read to dispatch on typeOf a?
roundTripAB :: (Show a, Read b) => a -> b
roundTripAB = undefined
--roundTripAB x = (read (show x)) :: x

main = do
    print (roundTrip 4)
    print (roundTripPF 4)
    --print (roundTripAB 4)
    print (id 4)

