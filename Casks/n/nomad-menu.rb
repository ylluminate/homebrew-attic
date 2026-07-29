cask "nomad-menu" do
  version "1.2.2"
  sha256 :no_check

  url "https://files.nomad.menu/NoMAD.pkg"
  name "NoMAD"
  homepage "https://nomad.menu/"


  depends_on :macos

  pkg "NoMAD.pkg"

  uninstall pkgutil: "com.trusourcelabs.NoMAD"

  zap trash: [
    "~/Library/Application Support/CrashReporter/NoMAD*",
    "~/Library/Logs/DiagnosticReports/NoMAD*",
    "~/Library/Preferences/com.trusourcelabs.NoMAD.plist",
  ]
end
