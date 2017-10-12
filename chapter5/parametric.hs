f :: a -> a
f a = a
-- this fails:
-- f a = 1

-- But if we constrain a to be a Num then this works
g :: (Num a) => a -> a
g a = 1

-- 2 implementations and the parameters must both be the same type
-- So (h 1 'a') doesn't work.
h :: a -> a -> a
--h i j = i
h i j = j


-- But you can use (id) for some other possible implemenations
--h i j = id i
--h i j = id j
--h i j = id (id i)
--h i j = id (id j)

-- And using anonymous functions yields the "true" form
--h = \i -> \j -> i
--h = \i -> \j -> j

-- Only "one" implemenation I could find, but both parameters
-- don't need to be the same.
i :: a -> b -> b
i a b = b
