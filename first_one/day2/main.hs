import Data.List (find, elemIndex)
import Data.Maybe (fromJust)

scoreRound :: Int -> Int -> Int
scoreRound a b = pts !! ((a - b) `mod` 3)
    where pts = [3, 0, 6]

scoreMatch :: String -> Int
scoreMatch [x,' ',y] = scoreRound foeMove ourMove + (ourMove + 1)
    where
        foeMove = fromJust $ elemIndex x foeMoves
        ourMove = fromJust $ elemIndex y ourMoves
        foeMoves = "ABC"
        ourMoves = "XYZ"

scoreMatch _ = error "xd"

main :: IO ()
main = do
    contents <- lines <$> getContents
    let contents' = fmap scoreMatch contents
    let score = sum contents'
    print score
