module TypeKwonDoTwo where

chk :: Eq b => (a -> b) -> a -> b -> Bool
chk aToB a b = (aToB a) == b

-- I don't see how to use the integer, i
arith :: Num b => (a -> b) -> Integer -> a -> b
arith aToB i a = (aToB a)
