module Functors2 where

data FixMePls a = FixMe | Pls a deriving (Eq, Show)

instance Functor FixMePls where
    fmap = error "it doesn't mastter, it won't compile, NOT. It does compile"
