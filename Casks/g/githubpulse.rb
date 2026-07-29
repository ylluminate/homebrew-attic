cask "githubpulse" do
  version "0.3.10"
  sha256 :no_check

  url "https://github.com/tadeuzagallo/GithubPulse/raw/master/dist/GithubPulse.zip"
  name "GithubPulse"
  desc "Statusbar app to help you remember to contribute every day on Github"
  homepage "https://github.com/tadeuzagallo/GithubPulse"


  depends_on :macos

  app "GithubPulse.app"

  caveats do
    requires_rosetta
  end
end
