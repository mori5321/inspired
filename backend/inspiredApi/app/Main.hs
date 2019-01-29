{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import Data.Monoid((<>))
import GHC.Generics
import Web.Scotty

import User



routes :: ScottyM()
routes = do
  get "/users" fetchAllUsers
  get "/users/:id" fetchUser

fetchAllUsers :: ActionM()
fetchAllUsers = do
  json allUsers
    
fetchUser :: ActionM()
fetchUser = do
  id <- param "id"
  json (filter (matchesId id) allUsers)



main :: IO ()
main = do
  putStrLn  "Starging Server..."
  scotty 3000 routes
