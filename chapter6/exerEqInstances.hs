module ExerEqInstance where

data TisAnInteger =
    TisAn Integer deriving Show

instance Eq TisAnInteger where
    (==) (TisAn i) (TisAn i') =  i == i'

data TwoIntegers =
    Two Integer Integer deriving Show

instance Eq TwoIntegers where
    (==) (Two i j) (Two i' j') =  (i == i') && (j == j')


data StringOrInt =
      TisAnInt      Int
    | TisAString    String deriving Show   

instance Eq StringOrInt where
    (==) (TisAnInt i) (TisAnInt i') = i == i'
    (==) (TisAString s) (TisAString s') = s == s'
    (==) _ _ = False

data Pair a =
    Pair a a deriving Show

instance Eq a => Eq (Pair a) where
    (==) (Pair v1 v2) (Pair v1' v2') = (v1 == v1') && (v2 == v2')

data Tuple a b =
    Tuple a b deriving Show

instance (Eq a, Eq b) => Eq (Tuple a b) where
    (==) (Tuple v1 v2) (Tuple v1' v2') = (v1 == v1') && (v2 == v2')

data Which a =
      ThisOne a
    | ThatOne a deriving Show

instance Eq a => Eq (Which a) where
    (==) (ThisOne v) (ThisOne v') = (v == v')
    (==) (ThatOne v) (ThatOne v') = (v == v')
    (==) _ _ = False

-- EitherOr generates warning when printing with -Wall:
-- Defaulting the following constraint to type ‘()’
--   Show b0 arising from a use of ‘print’
data EitherOr a b =
      Hello a
    | Goodbye b deriving Show

-- EitherOr Equality testing generates warnings with -Wall:
-- Defaulting the following constraint to type ‘()’
--   Show b0 arising from a use of ‘==’
instance (Eq a, Eq b) => Eq (EitherOr a b) where
    (==) (Hello v) (Hello v') = (v == v')
    (==) (Goodbye v) (Goodbye v') = (v == v')
    (==) _ _ = False
