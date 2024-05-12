{-# LANGUAGE ViewPatterns #-}

import Data.List (find, sortOn)
import Data.List.Split (splitOn)

mapToFunc m x = maybe x mapValue $ find inRange sortedmap
  where
    sortedmap = sortOn (\(_, b, _) -> b) m
    inRange (_, y, r) = y <= x && x < y + r
    mapValue (a, b, _) = a + x - b

parseInput :: String -> ([Int], [[(Int, Int, Int)]])
parseInput (lines -> ((words -> ("seeds:" : seeds)) : xs)) = (map read seeds, parseFuncs (splitOn [""] $ tail xs))
  where
    parseFuncs [] = []
    parseFuncs ((tail -> x) : xs) = map parseTriplet x : parseFuncs xs
    parseTriplet (map read . words -> [a, b, c]) = (a, b, c)

getResult (seeds, maps) = minimum $ map func seeds
  where
    funcs = reverse $ map mapToFunc maps
    func = foldr (.) id funcs

main = getContents >>= print . getResult . parseInput
