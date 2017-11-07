module Addition where

import Test.Hspec

sayHello :: IO ()
sayHello = hspec $ do
    describe "Addition" $ do
        it "1 + 1 is greater than 1" $ do
            ((1 :: Int) + (1 :: Int)) > 1 `shouldBe` True
