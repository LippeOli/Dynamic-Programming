-- Comportamentos indefinidos

main = do
    putStrLn $ show $ maximoIncompleto [3,4,5,1,8,3]
    putStrLn $ case maximoIncompleto [3] of 
                Nothing -> "Não tem"
                Just x -> show x

    putStrLn $ show $ takeWhile (<100) $ show $ dropWhile (<50) primos

maximoIncompleto :: Ord a => [a] -> Maybe a
maximoIncompleto [] = Nothing
maximoIncompleto [x] = Just x
maximoIncompleto (x:xs) = Just (maximoIncompletoAux x xs)

maximoIncompletoAux :: Ord a => a -> [a] -> a
maximoIncompletoAux m [] = m
maximoIncompletoAux m (x:xs) = maximoIncompletoAux (if x > m then x else m) xs

maximo :: Ord a => [a] -> Maybe a
maximo [] = Nothing
maximo [x] = Just x
maximo (x:xs) = case maximo xs of 
                    Nothing -> Just x
                    Just y -> Just $ if x > y then x else y

acha :: (a -> Bool) -> [a] -> Maybe a
acha _ [] = Nothing
acha t (x:xs)
    | t x = Just x
    | otherwise = acha t xs

primos :: [Int]
primos = sieve [2..]
  where
    sieve (p:xs) = p : sieve [x | x <- xs, x `mod` p /= 0]
