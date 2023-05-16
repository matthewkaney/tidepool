module Main where

import Sound.Osc.Fd as O

listenPort = 6011

main :: IO ()
main = do udp <- udpServer "127.0.0.1" listenPort
          loop udp
            where
              loop udp = 
                do m <- recvMessage udp
                   act udp m
                   loop udp

act :: O.Udp -> Maybe O.Message -> IO ()
act _ _ = putStrLn "aha"