import Data.List (find, elemIndex)
import Data.Maybe (fromJust)

moveRound :: Int -> Int -> Int
moveRound move outcome = (move - outcome) `mod` 3

scoreMatch :: String -> Int
scoreMatch [x,' ',y] = moveRound foeMove outcome + (pts !! outcome) + 1
    where
        foeMove = fromJust $ elemIndex x foeMoves
        outcome = fromJust $ elemIndex y outcomes
        foeMoves = "ABC"
        outcomes = "YXZ"
        pts = [3, 0, 6]

scoreMatch _ = error "xd"

main :: IO ()
main = do
    contents <- lines <$> getContents
    let contents' = fmap scoreMatch contents
    let score = sum contents'
    print score
