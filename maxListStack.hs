comprimentoMaximoSegmentoCrescente :: [Int] -> Int
comprimentoMaximoSegmentoCrescente = go 1 1
  where
    go _ maxLen [] = maxLen
    go currLen maxLen (x:y:xs)
      | y > x     = go (currLen + 1) (max currLen maxLen) (y:xs)
      | otherwise = go 1 (max currLen maxLen) (y:xs)
    go currLen maxLen [_] = max currLen maxLen

main :: IO ()
main = interact $ show . comprimentoMaximoSegmentoCrescente . map read . words
