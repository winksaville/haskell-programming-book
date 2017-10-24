module Filtering where

-- 1.
m3 = filter (\x -> (x `rem` 3 == 0))

-- 2.
l3 = length . m3

-- 3.
badWords :: String -> Bool
badWords "the" = True
badWords "a" = True
badWords "an" = True
badWords _ = False

myFilter xs = filter (\w -> not (badWords w)) (words xs)
