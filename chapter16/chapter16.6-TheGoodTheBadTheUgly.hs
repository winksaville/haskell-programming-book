module TheGoodTheBadTheUgly where

import Debug.Trace (trace, traceShow)

import Test.Hspec
import Test.QuickCheck

data WhoCares a =
    ItDoesnt | Matter a | WhatThisIsCalled deriving (Show)

genWhoCares :: Arbitrary a => Gen (WhoCares a)
genWhoCares = do
    a <- arbitrary
    elements [ItDoesnt, WhatThisIsCalled, Matter a]

genWhoCaresInt :: Gen (WhoCares Int)
genWhoCaresInt = genWhoCares

genListOfWhoCaresInt :: Gen [WhoCares Int]
genListOfWhoCaresInt = listOf genWhoCares

instance Eq a => Eq (WhoCares a) where
    (==) ItDoesnt ItDoesnt = True
    (==) (Matter a) (Matter a') = (a == a')
    (==) WhatThisIsCalled WhatThisIsCalled = True
    (==) _ _ = False

instance Arbitrary a => Arbitrary (WhoCares a) where
    arbitrary = genWhoCares

instance Functor WhoCares where
    fmap _ ItDoesnt = ItDoesnt
    fmap _ WhatThisIsCalled = WhatThisIsCalled
    fmap f (Matter a) = Matter (f a)

testIdLaw :: (Eq (f b), Functor f) => f b -> Bool
testIdLaw x = (fmap id x) == id x

propIdLaw :: Property
propIdLaw = forAll genWhoCaresInt (\x -> testIdLaw x)

testComp1 f a = fmap (f . f) a
testComp2 f b = (fmap f) . (fmap f) $ b
testCompLaw f a = (testComp1 f a) == (testComp2 f a)

propCompLaw :: (Show (f a), Functor f, Eq (f a)) =>
                    (a -> a) -> Gen (f a) -> Property
propCompLaw f genData = forAll genData (\x -> testCompLaw f x)
--propCompLaw f genData = forAll genData (\x -> trace ("x=" ++ show x) (testCompLaw f x))

data CountingBad a = Heisenberg Int a deriving (Eq, Show)

instance Functor CountingBad where
    fmap f (Heisenberg n a) = Heisenberg (n+1) (f a)


main :: IO ()
main = do
  let u = "Uncle"
      oneWhoKnocks = Heisenberg 0 u
      r = fmap (++" Jesse") oneWhoKnocks
      f = ((++" Jesse").(++" lol"))
      r_composed = fmap f oneWhoKnocks

  putStrLn $ "u=" ++ show u ++ " oneWhoKnocks=" ++ show oneWhoKnocks
  putStrLn $ "r=" ++ show r
  putStrLn $ "r_composed=" ++ show r_composed

  hspec $ do
    describe "testIdLaw" $ do
      it "testIdLaw id Matter" $ do
        testIdLaw (Matter 1) `shouldBe` True

      it "testIdLaw ItDoesnt" $ do
        testIdLaw (ItDoesnt :: (WhoCares Int)) `shouldBe` True

      it "testIdLaw WhatThisIsCalled" $ do
        testIdLaw (WhatThisIsCalled :: (WhoCares Int)) `shouldBe` True

    describe "propIdLaw" $ do
      it "Property IdLaw" $ do
        property propIdLaw


    describe "testComp" $ do
      it "test sample' genWhoCaresInt is non-zero length" $ do
        x <- sample' genWhoCaresInt
        length x /= 0 `shouldBe` True

      it "testComp1" $ do
        x <- sample' genWhoCaresInt
        testComp1 id x == testComp1 id x `shouldBe` True

      it "testComp2" $ do
        x <- sample' genWhoCaresInt
        testComp2 id x == testComp2 id x `shouldBe` True

      it "testCompLaw" $ do
        x <- sample' genWhoCaresInt
        testCompLaw id x `shouldBe` True

    describe "propCompLaw" $ do
      it "Property CompLaw" $ do
        property $ propCompLaw id genListOfWhoCaresInt
