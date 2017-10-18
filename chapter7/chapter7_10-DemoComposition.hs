module DemoComposition where

print' :: Show a => a -> IO ()
print' a = (putStrLn . show) a

printPF :: Show a => a -> IO ()
printPF = putStrLn . show
