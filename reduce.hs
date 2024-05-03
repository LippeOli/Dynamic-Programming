
main = do
    putStrLn $ show $ reduce (\x y -> x + y) 0 [3, 4, 5, 1, 2, 3] --funcao lambda adicao de dois alg
    putStrLn $ show $ reduce (+) 0 [3, 4, 5, 1, 2, 3]  -- adicao
    putStrLn $ show $ reduce  (*) 1 [3, 4, 5, 1, 2, 3] --multiplicacao
    putStrLn $ reduce (+++) "" ["Adenilso", " da", " Silva", " Simão"] --concatenacao
    putStrLn $ show len ["Adenilso", " da", " Silva", " Simão"]
    
    
reduce :: (b -> a -> a) -> a -> [b] -> a
reduce _ base [] = base
reduce op base (x:x5) = op x $ reduce op base x5

soma = reduce (+) 0

produto = reduce (*) 1

len = reduce (\xy -> 1 + y) 0
len1 = reduce ((+).(const 1)) 0

constante x = \y -> x
