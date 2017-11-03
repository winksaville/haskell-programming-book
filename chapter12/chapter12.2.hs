module Ch12_2 where

ifEvenAdd2 :: Integer -> Maybe Integer
ifEvenAdd2 x
    | even x = Just (x + 2)
    | otherwise = Nothing

type Name = String
type Age = Integer

-- Using Record syntax since I like it :)
data Person =
    MkPerson {
      name :: Name
    , age :: Age
    } deriving Show

-- Constructor using Maybe
mkPerson :: Name -> Age -> Maybe Person
mkPerson name age
    | name /= "" && age >= 0 = Just $ MkPerson name age
    | otherwise = Nothing
