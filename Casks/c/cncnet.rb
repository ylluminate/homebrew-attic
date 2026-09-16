cask "cncnet" do
  version "2.1"
  sha256 :no_check

  url "https://funkyfr3sh.cnc-comm.com/files/CnCNet.dmg"
  name "CnCNet: Classic Command & Conquer"
  desc "Multiplayer platform for classic Command & Conquer games"
  homepage "https://cncnet.org/"


  depends_on :macos

  app "CnCNet.app"

  caveats do
    requires_rosetta
  end
end
