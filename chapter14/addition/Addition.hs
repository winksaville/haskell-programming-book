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

trivialInt :: Gen Int
trivialInt = return 1

oneThroughThree :: Gen Int
oneThroughThree = elements [1,2,2,2,2,2,2,3]

genBool :: Gen Bool
genBool = choose (False, True)

genBool' :: Gen Bool
genBool' = elements [False, True]

genOrdering :: Gen Ordering
genOrdering = elements [LT, EQ, GT]

genTuple :: (Arbitrary a, Arbitrary b) => Gen (a, b)
genTuple = do
    a <- arbitrary
    b <- arbitrary
    return (a, b)

genTupleInts :: Gen (Int, Int)
genTupleInts = genTuple :: Gen (Int, Int)

genTupleCharInt :: Gen (Char, Int)
genTupleCharInt = genTuple :: Gen (Char, Int)

genThreeple :: (Arbitrary a, Arbitrary b, Arbitrary c) => Gen (a, b, c)
genThreeple = do
    a <- arbitrary
    b <- arbitrary
    c <- arbitrary
    return (a, b, c)

genEither :: (Arbitrary a, Arbitrary b) => Gen (Either a b)
genEither = do
    a <- arbitrary
    b <- arbitrary
    elements [Left a, Right b]

genEitherInt :: Gen (Either Int Int)
genEitherInt = genEither :: Gen (Either Int Int)

genMaybe :: Arbitrary a => Gen (Maybe a)
genMaybe = do
    a <- arbitrary
    elements [Nothing, Just a]

genMaybeInt :: Gen (Maybe Int)
genMaybeInt = genMaybe :: Gen (Maybe Int)

genMaybe' :: Arbitrary a => Gen (Maybe a)
genMaybe' = do
    a <- arbitrary
    frequency [ (1, return Nothing), (3, return (Just a))]

genMaybe'Int :: Gen (Maybe Int)
genMaybe'Int = genMaybe' :: Gen (Maybe Int)

prop_additionGreater :: Int -> Bool
prop_additionGreater x = x + 1 > x

prop_additionGreaterUntrue :: Int -> Bool
prop_additionGreaterUntrue x = x + 0 > x

runQc :: IO ()
runQc = quickCheck prop_additionGreater

runQc' :: IO ()
runQc' = quickCheck prop_additionGreaterUntrue

main :: IO ()
main = do
    s1 <- sample' (genMaybe :: Gen (Maybe Int))
    putStrLn $ "sample' (genMaybe :: Gen (Maybe Int))=" ++ show s1
    s2 <- sample' genMaybeInt
    putStrLn $ "sample' genMaybeInt=" ++ show s2
    s3 <- sample' genEitherInt
    putStrLn $ "sample' genEitherInt=" ++ show s3
