module FunctorsF where

class Sumthin a where
    s :: a -> a

class Else where
    e :: b -> f (g a b c)

class Biffy where
    slayer :: e a b
        -> (a -> c)
        -> (b -> d)
        -> e c d

--class Impish v where
--    impossibleKind :: v -> v b

-- But Impish is ok if v has a parameter in both "uses"
class Impish v where
    impishOkKind :: v a -> v b

--class AlsoImp v where
--    nope :: v a -> v

-- But AlsoImp' is ok again when number of parameters is the same
-- in this case the parameter is both "a" but they could be different
class AlsoImp v where
    ok :: v a -> v a

-- 1. kind of a is *
-- 2. b is a contrustor with one parameter and returns a *
--    T is a class with one parameter which is a function that takes
--    one parameter and returns a * (Probably wrong)
-- 3. c is * -> * -> * (Probably wrong)
