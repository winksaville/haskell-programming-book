module DoesNotCompile where

-- 1) doesn't compile wahoo
bigNum = (^) 5 $ 10
-- wahoo = bigNum $ 10

-- 2) result z = "hello world"
x = print
y = print "wooho!"
z = x "hello world"

-- 3) doesn't compile but if changing c to a 10 it compiles
-- with d = 210
a = (+)
b = 5
--c = b 10
c = a 10
d = c 200

-- 4) Doesn't compile a and b are already defined
--a = 12 + b
--b = 1000 * c
