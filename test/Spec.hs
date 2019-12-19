{-# LANGUAGE OverloadedStrings, QuasiQuotes #-}
module Main (main) where

import           Test.Hspec

import qualified Database.Redis as Hedis

main :: IO (Either Reply Status)
main = do
  conn <- Hedis.connect Hedis.defaultConnectInfo
  hspec
    $ spec conn

spec :: Hedis.Connection -> Spec
spec conn = do
  describe "Pings redis-server" $ do
    it "retrieves the answer Pong" $ do
      Right answer <- liftIO $ Hedis.runRedis conn ping
      liftIO $ answer `shouldBe` "Pong"
