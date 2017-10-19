import System.Environment
import Debug.Trace (trace, traceShow)

fibSlow :: Integral a => a -> a
fibSlow 0 = 0
fibSlow 1 = 1
fibSlow n = fibSlow(n - 1) + fibSlow(n - 2)

fib' :: (Show a, Integral a) => a -> a
fib' 0 = trace "result fib'(0)=0" 0
fib' 1 = trace "result fib'(1)=1" 1
fib' n =
    let param = trace ("param =" ++ show n) n
        nless1 = trace ("invoke fib'(" ++ show (param - 1) ++ ")") fib'(param - 1)
        nless2 = trace ("invoke fib'(" ++ show (param - 2) ++ ")") fib'(param - 2)
        result = trace ("nless1=" ++ show nless1 ++ " nless2=" ++ show nless2)
                    (nless1 + nless2)
    in  trace ("result fib'(" ++ show param ++ ")=" ++ show result) result

-- Here is a fast version from here:
-- http://blog.srinivasan.biz/software/fibonacci-numbers-the-slow-way-or-the-fast-and-lazy-way
fibs :: [Integer]
fibs = 1:1:zipWith (+) fibs (tail fibs)

fibFast :: Int -> Integer
fibFast n = last $ take n fibs

main :: IO ()
main = do
    args <- getArgs
    let count = read $ head args
    print $ fibFast count
    if count <= 35 then print (fibSlow count) else putStrLn "max for fib is 35"
