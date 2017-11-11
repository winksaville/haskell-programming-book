module FunctorLaws where

import Data.Char
import Test.Hspec

main = hspec $ do
    -- First law is law of identy
    -- fmap id == id
    describe "Functor: First Law of identity" $ do
        it "map id \"hi julie\" == \"hi julie\"" $ do
            fmap id "hi julie" == "hi julie" `shouldBe` True

    -- -- Not idendity but show it doesn't change the structure
    describe "toUpper a string" $ do
        it "fmap (\\c -> toUpper c) \"hi julie\" == \"HI JULIE\"" $ do
            fmap (\c -> toUpper c) "hi julie" == "HI JULIE" `shouldBe` True

    -- -- Not idendity but show it doesn't change the structure
    describe "toUpper a list of strings" $ do
        it "fmap (\\s -> map toUpper s)\
          \ [\"hi\", \"julie\"] == [\"HI\", \"JULIE\"]" $ do
            fmap (\s -> map toUpper s)
                ["hi", "julie"] == ["HI", "JULIE"] `shouldBe` True

    -- Second law is law of composition
    -- fmap (f . g) = fmap f . fmap g
    describe "Functor: Second Law of composition" $ do
        it "fmap ((+1) . (*2)) [1..5] == fmap (+1) . fmap (*2) [1..5]" $ do
            (fmap ((+1) . (*2)) [1..5]) ==
                ((fmap (+1) . fmap (*2)) [1..5]) `shouldBe` True
