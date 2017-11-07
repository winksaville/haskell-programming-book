{-# LANGUAGE DeriveGeneric #-}
module CoArbitrary where

-- I don't get CoArbitrary at all??

import GHC.Generics
import Test.QuickCheck

data Bool' = True' | False' deriving (Generic)

instance CoArbitrary Bool'

trueGen :: Gen Int
trueGen = coarbitrary True' arbitrary

falseGen :: Gen Int
falseGen = coarbitrary False' arbitrary

main :: IO ()
main = do
    s1 <- sample' trueGen
    putStrLn $ "s1=" ++ show s1
    s2 <- sample' falseGen
    putStrLn $ "s2=" ++ show s2
