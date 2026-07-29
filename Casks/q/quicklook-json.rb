cask "quicklook-json" do
  version "2,1.0"
  sha256 :no_check

  url "http://www.sagtau.com/media/QuickLookJSON.qlgenerator.zip"
  name "quick look JSON"
  desc "Quick Look plugin for JSON files"
  homepage "http://www.sagtau.com/quicklookjson.html"

  # Artifact not available over HTTPS

  depends_on :macos

  qlplugin "QuickLookJSON.qlgenerator"

  # No zap stanza required
end
