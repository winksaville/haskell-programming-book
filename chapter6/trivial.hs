module Trivial where

data Trivial =
    IsTrivial | NotTrivial

instance Eq Trivial where
    IsTrivial == IsTrivial = True
    NotTrivial == NotTrivial = True
    _ == _ = False
