cask "ibackupbot" do
  version "5.6.0"
  sha256 :no_check

  url "https://www.icopybot.com/iBackupBot-Setup.dmg"
  name "iBackupBot"
  desc "Backup manager for iTunes"
  homepage "https://www.icopybot.com/itunes-backup-manager.htm"


  depends_on :macos

  app "iBackupBot.app"

  caveats do
    requires_rosetta
  end
end
