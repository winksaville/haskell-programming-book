module EnumRanges where

eftBool :: Bool -> Bool -> [Bool]
eftBool a b = enumFromTo a b

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd x y = enumFromTo x y

eftInt :: Int -> Int -> [Int]
eftInt z a
    | z <= a = enumFromTo z a
    | otherwise = enumFromThenTo (z) (z-1) a

eftChar :: Char -> Char -> [Char]
eftChar first last = enumFromTo first last
