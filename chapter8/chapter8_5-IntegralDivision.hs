-- Indentation error :(
--dividedBy :: Integral a => a -> a -> (a, a)
--dividedBy num denom = go num denom 0
--   where go n d count
--      | n < d = (count, n)
--      | otherwise = go (n - d) d (count + 1)

dividedBy' :: Integral a => a -> a -> (a, a)
dividedBy' num denom = go num denom 0
  where
    go n d count
        | n < d = (count, n)
        | otherwise = go (n - d) d (count + 1)

dividedBy'' :: Integral a => a -> a -> (a, a)
dividedBy'' num denom = go num denom 0 where
    go n d count
        | n < d = (count, n)
        | otherwise = go (n - d) d (count + 1)

type Numerator = Integer
type Denominator = Integer
type Quotient = Integer
type Remainder = Integer

dividedBy :: Numerator -> Denominator -> (Quotient, Remainder)
dividedBy numerator denominator = go numerator denominator 0
  where
    go n d count
         | n < d = (count, n)
         | otherwise = go (n - d) d (count + 1)
