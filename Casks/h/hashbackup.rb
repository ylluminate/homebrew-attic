cask "hashbackup" do
  version "3336"
  sha256 :no_check

  url "https://www.hashbackup.com/download/hb-mac-64bit.tar.gz"
  name "HashBackup"
  desc "Command-line backup program"
  homepage "https://www.hashbackup.com/hashbackup/"

  livecheck do
    url "https://www.hashbackup.com/hashbackup/releases.html"
    regex(/id=["']?_?(\d+)/i)
  end


  depends_on :macos

  binary "hb"

  zap trash: "~/hashbackup"

  caveats do
    requires_rosetta
  end
end
