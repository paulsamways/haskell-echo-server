module Main where

import Network.HTTP.Types.Status
import Network.Wai
import Network.Wai.Handler.Warp
import Text.Pretty.Simple

main :: IO ()
main = run 8000 handler

-- Type of a function that writes the response back to the client
type ResponseWriter = (Response -> IO ResponseReceived)


handler :: Request -> ResponseWriter -> IO ResponseReceived
handler request writeResponse = do
  pPrint request
  
  let myResponse = responseLBS status200 [] mempty
  writeResponse myResponse
