cask "tsh" do
  version "16.4.7"
  sha256 "b101344390382c8e3d858f2ff5fbd59658552fe0d832a946578219ec10347b20"

  url "https://cdn.teleport.dev/tsh-#{version}.pkg",
      verified: "cdn.teleport.dev/"
  name "Teleport TSH"
  desc "SSH server for teams managing distributed infrastructure"
  homepage "https://goteleport.com/"


  conflicts_with cask: [
    "teleport-suite",
    "teleport-suite@16",
    "teleport-suite@17",
  ]
  depends_on :macos

  pkg "tsh-#{version}.pkg"

  uninstall pkgutil: "(.*).com.gravitational.teleport.tsh"

  zap trash: "~/.tsh"
end
