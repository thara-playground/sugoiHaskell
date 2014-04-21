-- main = do line <- getLine
--           let line' = reverse line
--           putStrLn $ "You said " ++ line' ++ " backwards!"
--           putStrLn $ "Yes, you said " ++ line' ++ " backwards!"
main = do line <- fmap reverse getLine
          putStrLn $ "You said " ++ line ++ " backwards!"
          putStrLn $ "Yes, you said " ++ line ++ " backwards!"

