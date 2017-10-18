module ArtfulDodgy where

dodgy x y = x + y * 10
oneIsOne = dodgy 1
oneIsTwo = (flip dodgy) 2

-- Test programs
test1 f a b = (f a) == b
test2 f a b c = (f a b) == c

main = do
    print $ test2 dodgy 1 0 1
    print $ test2 dodgy 1 1 11
    print $ test2 dodgy 2 2 22
    print $ test2 dodgy 1 2 21
    print $ test2 dodgy 2 1 12
    print $ test1 oneIsOne 1 11 
    print $ test1 oneIsOne 2 21 
    print $ test1 oneIsTwo 1 21
    print $ test1 oneIsTwo 2 22
    print $ test1 oneIsOne 3 31
    print $ test1 oneIsTwo 3 23
