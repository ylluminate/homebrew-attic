cask "bfxr" do
  version "1.5.1"
  sha256 :no_check

  url "https://ded.bfxr.net/~locus/bfxr_update/Bfxr_MAC.zip"
  name "Bfxr"
  desc "Make sound effects for computer games"
  homepage "https://www.bfxr.net/"


  depends_on :macos

  app "Bfxr.app"

  caveats do
    requires_rosetta
  end
end
