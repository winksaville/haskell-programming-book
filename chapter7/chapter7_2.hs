module Chaoter7_2 where

myNum :: Integer
myNum = 1

myVal :: t -> Integer
myVal f = myNum

myVal' :: Integer -> Integer
myVal' f = f + myNum

myNum2 :: Num a => a
myNum2 = 1

myVal2 :: Num a => a -> a
myVal2 x = x + myNum2

stillAFunction :: [a] -> [a] -> [a] -> [a]
stillAFunction xs ys zs = xs ++ ys ++ zs

addOne :: Integer -> Integer
addOne x = x + 1

bindExp :: Integer -> String
bindExp x =
    let y = 5 in
    "the integer parameter was: " ++ show x
    ++ " and y was: " ++ show y
