cask "clickhouse" do
  arch arm: "-aarch64"

  version "26.7.3.19-stable"
  sha256 arm:   "53644a8269e372bfde0a78c8ffd9baad256e9c17bddbc2db43459dfa7256efd3",
         intel: "4680a21fa259542c8b04943b84e3106d444e28c754ce1c7e978d96a96e93434f"

  url "https://github.com/ClickHouse/ClickHouse/releases/download/v#{version}/clickhouse-macos#{arch}"
  name "Clickhouse"
  desc "Column-oriented database management system"
  homepage "https://clickhouse.com/"

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+[._-](lts|stable))$/i)
  end


  depends_on :macos

  binary "clickhouse-macos#{arch}", target: "clickhouse"

  # No zap stanza required
end
