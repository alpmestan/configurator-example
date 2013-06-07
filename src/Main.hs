{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.Configurator as C
import Data.Configurator.Types
import Data.Monoid
import qualified Data.Text as T
import qualified Data.Text.IO as T

cfgFile :: FilePath
cfgFile = "/Users/alp/haskell/configurator-example/ex.cfg"

main :: IO ()
main = do
    (cfg, threadId) <- C.autoReload C.autoConfig [ C.Required cfgFile ]
    putStrLn ("-> Config watcher thread id: " ++ show threadId)
    C.subscribe cfg (C.prefix "pos") onPosChange
    loop cfg

    where loop :: Config -> IO ()
          loop cfg = do
              putStrLn "-> Type 'show' or 'quit', and feel free to modify ex.cfg while this runs:"
              s <- getLine
              case s of
                  "quit" -> return ()
                  "show" -> do
                      x <- C.lookup cfg "pos.x"
                      y <- C.lookup cfg "pos.y"
                      print (x :: Maybe Int) >> print (y :: Maybe Int)
                      loop cfg
                  _      -> loop cfg

onPosChange :: Name -> Maybe Value -> IO ()
onPosChange key newVal = T.putStrLn ("--- " <> key <> " has been changed to: " <> T.pack (show newVal) <> " ---")