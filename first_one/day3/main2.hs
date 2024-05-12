{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
import GHC.OldList (intersect, elemIndex)
import Data.Maybe (fromJust)

f :: [String] -> Int
f (s1:s2:s3:xs) = score s1 s2 s3 + f xs
f [ ]           = 0

score :: String -> String -> String -> Int
score s1 s2 s3 = key $ head intersection'
    where intersection' = intersect s1 s2 `intersect` s3

key :: Char -> Int
key c = (1 +) $ fromJust $ elemIndex c chars
    where chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

main :: IO ()
main = do
    contents  <- lines <$> getContents
    let contents' = f contents
    print contents'
