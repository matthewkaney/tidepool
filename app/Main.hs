module Main where

import Sound.Tidal.Parse

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
act _ (Just (O.Message _ [O.AsciiString str])) = (putStrLn . show . parseTidal) (O.ascii_to_string str)