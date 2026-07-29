cask "machacha" do
  version "4.0.1"
  sha256 :no_check

  url "https://www.julifos.com/soft/machacha/machacha.dmg"
  name "MacHacha"
  desc "Split archives into smaller parts and join them when requested"
  homepage "https://www.julifos.com/soft/machacha/"


  depends_on :macos

  app "MacHacha.app"

  zap trash: [
    "~/Library/Preferences/com.pescadosweb.machacha.plist",
    "~/Library/Saved Application State/com.pescadosweb.machacha.savedState",
  ]

  caveats do
    requires_rosetta
  end
end
