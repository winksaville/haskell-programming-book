module Chapter8_2 where

fourFactorial :: Integer
fourFactorial = 4 * 3 * 2 * 1

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n -1)

incTimes :: (Eq a, Num a) => a -> a -> a
incTimes 0 n = n
incTimes times n = 1 + (incTimes (times - 1) n)

