module Cardinality where

-- 1. cardinality 1
-- 2. cardinality 3
-- 3. cardinality 65536
-- 4. cardinality 2^64 for Int and "infinite" for Integer
-- 5. 2^8

data Example = MakeExample deriving Show

-- 1.a :t MakeExample
-- MakeExample :: Example
-- 1.b :t Example  (Example has Kind but not type)
-- Error not in scope

-- 2. :i Example
-- data Example = MakeExample
--   	-- Defined at chapter11.7-exercises.hs:9:1
-- instance [safe] Show Example
--   -- Defined at chapter11.7-exercises.hs:9:37

-- 3.
data Example' = MakeExample' Int

-- :t MakeExample'
--MakeExample' :: Int -> Example'


newtype Goats = Goats Int deriving (Eq, Show)
tooManyGoats :: Goats -> Bool
tooManyGoats (Goats n) = n > 43

data Goats' = Goats' Int deriving (Eq, Show)
tooManyGoats' :: Goats' -> Bool
tooManyGoats' (Goats' n) = (n > 24)

newtype Cows = Cows Int deriving (Eq, Show)
tooManyCows :: Cows -> Bool
tooManyCows (Cows n) = (n > 64)

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

instance TooMany Goats where
  tooMany (Goats n) = n > 43

instance TooMany Goats' where
  tooMany (Goats' n) = n > 43
