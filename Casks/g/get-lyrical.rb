cask "get-lyrical" do
  version "3.8"
  sha256 :no_check

  url "https://shullian.com/files/getlyrical.zip"
  name "Get Lyrical"
  desc "Automatically add lyrics to songs in iTunes"
  homepage "https://shullian.com/get_lyrical.php"


  depends_on :macos

  app "Get Lyrical/Get Lyrical.app"

  caveats do
    requires_rosetta
  end
end
