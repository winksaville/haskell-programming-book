import Test.QuickCheck

genTupleIntegral ::
    (Integral a, Arbitrary a, Integral b, Arbitrary b)
    => Gen (a, b)
genTupleIntegral = do
    a <- arbitrary
    b <- arbitrary
    return (a, b)

genTupleInt :: Gen (Int, Int)
genTupleInt = genTupleIntegral

genTupleInteger :: Gen (Integer, Integer)
genTupleInteger = genTupleIntegral

genTupleWord :: Gen (Word, Word)
genTupleWord = genTupleIntegral

-- As desired this is a compile error
--genTupleFloat :: Gen (Float, Float)
--genTupleFloat = genTupleIntegral
