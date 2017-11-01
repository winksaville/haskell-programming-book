module BinaryTree where

data BinaryTree a =
      Leaf
    | Node (BinaryTree a) a (BinaryTree a)
    deriving (Eq, Ord, Show)

insert' :: Ord a => a -> BinaryTree a -> BinaryTree a
insert' b Leaf = Node Leaf b Leaf -- Handle empty tree or adding a leaf on a larger tree
insert' b (Node left a right) -- Non empty tree
    | b == a = Node left a right -- Rebild the same tree
    | b < a = Node (insert' b left) a right -- insert b somewhere on the left subtree of a
    | b > a = Node left a (insert' b right) -- insert b somewhere on the right subtree of a

mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) =
    Node (mapTree f left) (f a) (mapTree f right)

t1 = insert' 0 Leaf

testTree' :: BinaryTree Integer
testTree' =
    Node (Node Leaf 3 Leaf)
        1
        (Node Leaf 4 Leaf)

mapExpected =
    Node (Node Leaf 4 Leaf)
        2
        (Node Leaf 5 Leaf)

mapOkay =
    if mapTree (+1) testTree' == mapExpected
    then print "yup okay!"
    else error "test failed!"

preorder :: BinaryTree a -> [a]
preorder Leaf = []
preorder (Node left x right) = (concat [[x], (preorder left), (preorder right)])

inorder :: BinaryTree a -> [a]
inorder Leaf = []
inorder (Node left x right) = (concat [(inorder left), [x], (inorder right)])

postorder :: BinaryTree a -> [a]
postorder Leaf = []
postorder (Node left x right) = (concat [(postorder right), (postorder left), [x]])

testTree :: BinaryTree Integer
testTree =
    Node (Node Leaf 1 Leaf)
         2
         (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder =
    if preorder testTree == [2, 1, 3]
    then putStrLn "Preorder fine!"
    else putStrLn "Preorder FAILS!"

testInorder :: IO ()
testInorder =
    if inorder testTree == [1, 2, 3]
    then putStrLn "Inorder fine!"
    else putStrLn "Inorder FAILS!"

testPostorder :: IO ()
testPostorder =
    if postorder testTree == [3, 1, 2]
    then putStrLn "Postorder fine!"
    else putStrLn "Postorder FAILS!"


-- Skipping
foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree = undefined
