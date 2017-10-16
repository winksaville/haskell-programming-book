module Chapter7_4ExercisesVarietyPack where

-- 1.
k :: (a, b) -> a
k (x, y) = x

--k1 :: (Integral, Integral) -> Integral
--The above is WRONG it's type is:
k1 :: Integer -- return 3
k1 = k ((4-1), 10)

k2 :: [Char] -- returns "three"
k2 = k ("three", (1 + 2))

k3 :: Integer -- return 3
k3 = k (3, True)


f :: (a, b, c)
    -> (d, e, f)
    -> ((a, d), (c, f))
f (a, b, c) (d, e, f) = ((a, d), (c, f))
