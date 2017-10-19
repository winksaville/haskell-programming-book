module FibonacciNumbers where
import Debug.Trace (trace, traceShow)

fib :: Integral a => a -> a
fib 0 = 0
fib 1 = 1
fib n = fib(n - 1) + fib(n - 2)

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
