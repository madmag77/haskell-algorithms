module Lib
    ( someFunc,
      mergeSort,
      merge
    ) where

someFunc :: IO ()
someFunc = putStrLn "someFunc"

mergeSort :: [Integer] -> [Integer]
mergeSort x = let
                 merge list1 list2 result | list1 == [] && list2 == [] = result
                                          | list1 == [] = result ++ list2
                                          | list2 == [] = result ++ list1
                                          | head list1 > head list2 = merge list1 (tail list2) (result ++ [(head list2)])
                                          | head list1 <= head list2 = merge (tail list1) list2 (result ++ [(head list1)])

                 split list | length list == 1 = [head list]
                            | length list > 1 = merge (split (fst (splitAt ((length list) `div` 2) list)))  (split (snd (splitAt ((length list) `div` 2) list))) []

              in
                 split x

merge :: [Integer] -> [Integer] -> [Integer]
merge x y = let
              helper list1 list2 result | list1 == [] && list2 == [] = result
                                        | list1 == [] = result ++ list2
                                        | list2 == [] = result ++ list1
                                        | head list1 > head list2 = helper list1 (tail list2) (result ++ [(head list2)])
                                        | head list1 <= head list2 = helper (tail list1) list2 (result ++ [(head list1)])
           in
              helper x y []