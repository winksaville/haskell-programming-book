{-# LANGUAGE GeneralizedNewtypeDeriving,FlexibleInstances #-}
module NewTypes where

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

-- 1.
instance TooMany (Int, String) where
  tooMany (n, _) = n > 100

-- 2.
instance TooMany (Int, Int) where
  tooMany (n1, n2) = (n1 + n2) > 100

-- 3. Couldn't get this to compile
--instance TooMany (Num a, TooMany a) => (a, a) where
--  tooMany (n1, n2) = (n1 + n2) > 100

newtype Goats = Goats Int deriving (Eq, Show, TooMany)

newtype Cows = Cows Int deriving (Eq, Show, TooMany)

-- Define functions
tooManyGoats :: Goats -> Bool
tooManyGoats (Goats n) = n > 43
tooManyCows :: Cows -> Bool
tooManyCows (Cows n) = (n > 64)

main = do
    putStrLn $ "tooMany (42 :: Int)=" ++ show (tooMany (42 :: Int))
    putStrLn $ "tooMany (43 :: Int)=" ++ show (tooMany (43 :: Int))
    putStrLn $ "tooMany (Goats 42)=" ++ show (tooMany (Goats 42))
    putStrLn $ "tooMany (Goats 43)=" ++ show (tooMany (Goats 43))
    putStrLn $ "tooMany (10 :: Int, \"Hi\")=" ++ show (tooMany (10 :: Int, "Hi"))
    putStrLn $ "tooMany (101 :: Int, \"Big Deal\")=" ++ show (tooMany (101 :: Int, "Big Deal"))
    putStrLn $ "tooMany (10 :: Int, 90 :: Int)=" ++ show (tooMany (10 :: Int, 90 :: Int))
    putStrLn $ "tooMany (10 :: Int, 91 :: Int)=" ++ show (tooMany (10 :: Int, 91 :: Int))
