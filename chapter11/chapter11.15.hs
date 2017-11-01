module HigherKindedDataTypes where

data Silly a b c d = MkSilly a b c d deriving Show

-- Using HKDT looks powerful, it looks like Templates in C++
-- where you can delay defining a type until used.
type DocVersion = String

data EsResultFound a =
    EsResultFound { _version :: DocVersion
                  , _source :: a
    } deriving (Eq, Show)
