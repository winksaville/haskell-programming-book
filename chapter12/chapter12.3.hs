module Ch12_3 where

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

data PersonInvalid = NameEmpty | AgeToLow deriving (Eq, Show)

-- Constructor usng Either which allows you return more specific errors
mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
    | name /= "" && age >= 0 = Right $ MkPerson name age
    | name == "" = Left NameEmpty
    | otherwise = Left AgeToLow

-- Constructor usng Either with an array of PersonInvald so we return any number of reasons
mkPerson' :: Name -> Age -> Either [PersonInvalid] Person
mkPerson' name age
    | (nameOk name) && ageOk age = Right $ MkPerson name age
    | not (nameOk name) && not (ageOk age) = Left $ [NameEmpty, AgeToLow]
    | not (nameOk name) = Left [NameEmpty]
    | otherwise = Left [AgeToLow]
    where
        nameOk n = n /= ""
        ageOk a = a >= 0

-- Type alias for Either [PersonInvalid]
type ValidatePerson a = Either [PersonInvalid] a

-- Have nameOk and ageOk return the desired errors instead of Bool.
-- This has the advantage that the errors being returned
-- are defined in one place instead of being mentioned in
-- two different places n mkPerson'' above
mkPersonX :: Name -> Age -> ValidatePerson Person
mkPersonX name age = mkPersonX' (nameOk name) (ageOk age)
    where
        nameOk n = if n /= "" then Right n else Left [NameEmpty]
        ageOk a = if a >= 0 then Right a else Left [AgeToLow]
        mkPersonX' :: ValidatePerson Name -> ValidatePerson Age -> ValidatePerson Person
        mkPersonX' (Right nameOk) (Right ageOk) = Right $ MkPerson nameOk ageOk
        mkPersonX' (Left nameErr) (Left ageErr) = Left $ nameErr ++ ageErr
        mkPersonX' (Left nameErr) _ = Left nameErr
        mkPersonX' _ (Left ageErr) = Left ageErr

-- Note mkPersonX will be made simpler with "
