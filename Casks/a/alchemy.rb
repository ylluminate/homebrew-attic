cask "alchemy" do
  version "008"
  sha256 "7527f4e2231db8167c57d2639fcba166d8fefea091cca7884bd355fb52a3449a"

  url "https://al.chemy.org/files/Alchemy-#{version}.dmg"
  name "Alchemy"
  desc "Open drawing project"
  homepage "https://al.chemy.org/"


  depends_on :macos

  app "Alchemy/Alchemy.app"
end
