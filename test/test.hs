import Control.Monad
import System.Exit (exitFailure)
import System.IO (BufferMode(..), hSetBuffering, stdout, stderr)

import qualified Test.Data.Connection as C
import qualified Test.Data.Connection.Int as CI
import qualified Test.Data.Connection.Word as CW
import qualified Test.Data.Connection.Float as CF
import qualified Test.Data.Connection.Ratio as CR
--import qualified Test.Data.Semilattice.Unsigned as U

tests :: IO [Bool]
tests = sequence [C.tests, CI.tests, CW.tests, CF.tests, CR.tests] 

main :: IO ()
main = do
  hSetBuffering stdout LineBuffering
  hSetBuffering stderr LineBuffering

  results <- tests

  unless (and results) exitFailure
