-- matchingTuples1.hs
module TupleFunctions where

addEmUp2 :: (Num a, Show a) => (a, a) -> a
addEmUp2 (x, y) = x + y

-- Not matching syntax
addEmUp2Alt :: (Num a, Show a) => (a, a) -> a
addEmUp2Alt tuple = (fst tuple) + (snd tuple)

fst3 :: (a, b, c) -> a
fst3 (x, _, _) = x

third3 :: (a, b, c) -> c
third3 (_, _, x) = x
