cask "tvrenamer" do
  version "0.8"
  sha256 "fa250e1641d473d5ece9959c8f3091ab18ad9eddb5a6bccb062212c84cc6aca8"

  url "https://github.com/tvrenamer/tvrenamer/releases/download/v#{version}/TVRenamer-#{version}-osx64.zip"
  name "TVRenamer"
  desc "Utility to rename TV episodes from TV listings"
  homepage "https://www.tvrenamer.org/"


  depends_on :macos

  app "TVRenamer-#{version}.app"

  caveats do
    depends_on_java
    requires_rosetta
  end
end
