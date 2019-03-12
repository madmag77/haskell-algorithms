module Main where

import Lib

main :: IO ()
main = do someFunc
          print (mergeSort [6,8,3,4,5])
          print (merge [1,4,6] [0,5,8])

