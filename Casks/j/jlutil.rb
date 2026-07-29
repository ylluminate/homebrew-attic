cask "jlutil" do
  version :latest
  sha256 :no_check

  url "https://newosxbook.com/tools/jlutil.tgz"
  name "SimPLISTic"
  name "jlutil"
  desc "Property list utility"
  homepage "https://newosxbook.com/tools/simplistic.html"


  depends_on :macos

  binary "jlutil.universal", target: "jlutil"

  # No zap stanza required
end
