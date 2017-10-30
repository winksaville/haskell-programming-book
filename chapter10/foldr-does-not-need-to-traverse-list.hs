fr :: Num a => [a] -> a
fr xs = foldr (\x y -> 1234) 0 xs

main :: IO ()
main = do
    let y = fr [undefined]
    putStrLn $ "y=" ++ show y ++ if y == 1234 then " OK" else " BAD"
