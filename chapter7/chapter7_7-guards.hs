module Guards where

-- Use If
myAbsIf :: Integer -> Integer
myAbsIf x = if (x < 0) then (-x) else x

-- Use Guards
myAbs :: Integer -> Integer
myAbs x
    | x < 0 = (-x)
    | otherwise = x

bloodNa :: Integer -> String
bloodNa x
    | x < 135 = "too low"
    | x > 145 = "too high"
    | otherwise = "just right"

isRight :: (Num a, Eq a) => a -> a -> a -> String
isRight a b c
    | a^2 + b^2 == c^2 = "RIGHT ON"
    | otherwise = "not Right"

dogYrs :: Integer -> Integer
dogYrs x
    | x == 0 = 0
    | x <= 1 = x * 15
    | x <= 2 = x * 12
    | x <= 3 = x * 8
    | otherwise = x * 6

avgGrade :: (Fractional a, Ord a) => a -> Char
avgGrade x
    | y >= 0.9 = 'A'
    | y >= 0.8 = 'B'
    | y >= 0.7 = 'C'
    | y >= 0.6 = 'D'
    | otherwise = 'F'
    where y = x / 100

-- 1. Everthing return 'F' if otherwise is first
-- 2. If 'C' is moved up then only 'C', 'D' and 'F' can be returned
-- 3. b)
pal :: (Eq a) => [a] -> Bool
pal xs
    | xs == reverse xs = True
    | otherwise = False
-- 4. Types that implment Eq
-- 5. pal :: (Eq a) => [a] -> Bool
-- 6. c)
numbers :: (Num a, Ord a) => a -> Integer
numbers x
    | x < 0  = (-1)
    | x == 0 = 0
    | x > 0  = 1
-- 7. Types Num
-- 8. numbers :: (Num a, Ord a) => a -> Integer
