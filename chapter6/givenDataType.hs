module GiveDataType where

data Rocks =
    Rocks String deriving (Eq, Show)

data Yeah =
    Yeah Bool deriving (Eq, Show)

data Papu =
    Papu Rocks Yeah
    deriving (Eq, Show)

-- 1.
phew = Papu (Rocks "chases") (Yeah True)

-- 2.
equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p'
