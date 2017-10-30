module Doggies where

data PugType = PugData

data HuskyType a = HuskyData a

data DogueDeBordeaux doge =
    DogueDeBordeaux doge

data Doggies a =
      Husky a
    | Mastiff a
    deriving (Eq, Show)

-- 1. Doggies is a type constructor

-- 2. :k Doggies
-- Doggies :: * -> *

-- 3. :k Doggies String
-- Doggies String :: *

-- 4. :t Husky 10
-- Husky :: Integer (Wrong)
-- Husky 10 :: Num a => Doggies a

-- 5. :t Husky (10 :: Integer)
-- Husky (10 :: Integer) :: Integer a => Doggies a (Wrong)
-- Husky (10 :: Integer) :: Doggies Integer

-- 6. :t Mastiff "Scooby Doo"
-- Mastiff "Scooby Doo" :: Doggies String

-- 7. DogueDeBordeaux is both type and data constructor

-- 8. :t DogueDeBordeaux
-- DogueDeBordeaux :: * -> * (Wrong)
-- DogueDeBordeaux :: doge -> DogueDeBordeaux doge

-- 9. :t DogueDeBordeaux "doggie!"
-- DogueDeBordeaux "doggie!" :: DodueDeBordeaux [Char]

