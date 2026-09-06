cask "foldingtext" do
  version "2.2"
  sha256 :no_check

  url "https://foldingtext.s3.amazonaws.com/FoldingText.dmg"
  name "FoldingText"
  desc "Markdown text editor with productivity features"
  homepage "https://www.foldingtext.com/"


  depends_on :macos

  app "FoldingText.app"

  caveats do
    requires_rosetta
  end
end
