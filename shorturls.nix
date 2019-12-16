{ mkDerivation, aeson, base, bytestring, hedis, hspec, hspec-wai
, http-types, random, scotty, stdenv, text, transformers, wai
, wai-extra
}:
mkDerivation {
  pname = "shorturls";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    aeson base bytestring hedis random scotty text transformers wai
  ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [
    base bytestring hedis hspec hspec-wai http-types wai-extra
  ];
  homepage = "https://github.com/githubuser/shorturls#readme";
  license = stdenv.lib.licenses.bsd3;
}
