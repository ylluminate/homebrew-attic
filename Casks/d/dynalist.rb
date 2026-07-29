cask "dynalist" do
  version "1.0.6"
  sha256 :no_check

  url "https://dynalist.io/standalone/download?file=Dynalist.dmg"
  name "Dynalist"
  desc "Outlining app for your work"
  homepage "https://dynalist.io/"


  depends_on :macos

  app "Dynalist.app"

  caveats do
    requires_rosetta
  end
end
