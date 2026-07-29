cask "fstream" do
  version "1.4.9"
  sha256 :no_check

  url "https://www.sourcemac.com/fstream_FStream.tgz"
  name "FStream"
  desc "WebRadio listener/recorder software"
  homepage "https://www.sourcemac.com/?page=fstream"


  depends_on :macos

  app "FStream.app"

  caveats do
    requires_rosetta
  end
end
