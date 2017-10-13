module Add where

add :: Num a => a -> a -> a
add x y = if x > 1 then x + y else x
