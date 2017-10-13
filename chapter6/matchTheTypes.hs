module MatchTheTypes where

-- 1. yes works, but "i :: a" doesn't work because to use a literal you must have concrete type
i :: Num a => a
i = 1

