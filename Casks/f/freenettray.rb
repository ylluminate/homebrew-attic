cask "freenettray" do
  version "2.2.0"
  sha256 "1351ee80def91f0fd7bb0903921d1987070e38787eacdb0ae8801b8f52bf0dac"

  url "https://github.com/freenet/mactray/releases/download/v#{version}/FreenetTray_#{version}.zip"
  name "Freenet"
  desc "Menu bar application to control Freenet"
  homepage "https://freenetproject.org/"


  depends_on :macos

  app "FreenetTray.app"

  zap trash: [
    "~/Library/Application Support/Freenet",
    "~/Library/Preferences/org.freenetproject.mactray.plist",
  ]

  caveats do
    requires_rosetta
  end
end
