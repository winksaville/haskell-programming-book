module Addition where

import Test.Hspec
import Test.QuickCheck

dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where go n d count
           | n < d = (count, n)
           | otherwise = go (n - d) d (count + 1)

multiplyBy :: (Eq a, Integral a) => a -> a -> a
multiplyBy v1 v2 = go v1 v2 0
    where go v1' v2' prod
           | v2' == 0 = prod
           | otherwise = go v1' (v2' - 1) (prod + v1')

sayHello :: IO ()
sayHello = hspec $ do
    describe "Addition" $ do
        it "1 + 1 is greater than 1" $ do
            ((1 :: Int) + (1 :: Int)) > 1 `shouldBe` True
        it "x + 1 is alwyas greater than x" $ do
            property $ \x -> x + 1 > (x :: Int)
        it "2 + 2 is equal to 4" $ do
            ((2 :: Int) + (2 :: Int)) `shouldBe` (4 :: Int)
        it "22 divided by 5 is 4 remainder 2" $ do
            dividedBy (22 :: Int) 5 `shouldBe` (4, 2)
        it "1 multipled by 1 is 1" $ do
            multiplyBy (1 :: Int) 1 `shouldBe` 1
        it "0 multipled by 1 is 0" $ do
            multiplyBy (0 :: Int) 1 `shouldBe` 0
        it "1 multipled by 0 is 0" $ do
            multiplyBy (1 :: Int) 0 `shouldBe` 0
        it "4 multipled by 4 is 16" $ do
            multiplyBy (4 :: Int) 4 `shouldBe` 16
