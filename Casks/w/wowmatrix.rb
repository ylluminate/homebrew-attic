cask "wowmatrix" do
  version "8.0.2.0"
  sha256 :no_check

  url "https://swupdate.wowmatrix.com/mac/WowMatrix.zip"
  name "WowMatrix"
  desc "WoW AddOn Installer and Updater"
  homepage "https://www.wowmatrix.com/"


  depends_on :macos

  app "WowMatrix.app"

  caveats do
    requires_rosetta
  end
end
