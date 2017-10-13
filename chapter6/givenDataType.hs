module GiveDataType where

data Rocks =
    Rocks String deriving (Eq, Ord, Show)

data Yeah =
    Yeah Bool deriving (Eq, Ord, Show)

data Papu =
    Papu Rocks Yeah
    deriving (Eq, Ord, Show)

-- 1.
phew = Papu (Rocks "chases") (Yeah True)

-- 2.
equalityForAll :: Papu -> Papu -> Bool
equalityForAll p p' = p == p'

-- 3.
compareForAll :: Papu -> Papu -> Bool
compareForAll p p' = p > p'
