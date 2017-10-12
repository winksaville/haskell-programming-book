module TypeKwonDo where

-- 0. the worked out example

--data Woot
--
--data Blah
--
--f :: Woot -> Blah
--f = undefined
--
--g :: (Blah, Woot) -> (Blah, Blah)
--g (b, w) = (b, f w)


-- 1.
f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h i = g (f i)

-- 2.
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e a = w $ q a
