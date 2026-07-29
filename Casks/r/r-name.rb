cask "r-name" do
  version "3.1"
  sha256 :no_check

  url "https://www.jacek-dom.net/software/R-Name/R-Name.app.zip"
  name "R-Name"
  homepage "https://www.jacek-dom.net/software/R-Name/"


  depends_on :macos

  app "R-Name.app"

  caveats do
    requires_rosetta
  end
end
