class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.18/inferencesh-cli-v1.19.18-darwin-arm64.tar.gz"
      sha256 "c5c7d1d91cc9b775408b9dabdab80445fb9e5ad9fec7cf4f6490b3518c5efdf4"
    else
      url "https://dist.inference.sh/cli/v1.19.18/inferencesh-cli-v1.19.18-darwin-amd64.tar.gz"
      sha256 "c7da22dd0856b59bf71c6c9f3a5faa78b5c88c81c5e5d558dbc53690885b44c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.18/inferencesh-cli-v1.19.18-linux-arm64.tar.gz"
      sha256 "9fbbf4d09bb8be1b95d5ddad5f869af2db8e938bab9d69b47c6ee99aea994911"
    else
      url "https://dist.inference.sh/cli/v1.19.18/inferencesh-cli-v1.19.18-linux-amd64.tar.gz"
      sha256 "5d8725f2e518dc41db067e00e7e61d80539395ffd91282cd2e46e676b67ad571"
    end
  end

  def install
    binary = Dir["inferencesh-cli-*"].first
    bin.install binary => "belt"
    bin.install_symlink "belt" => "infsh"
    bin.install_symlink "belt" => "inferencesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/belt version")
  end
end
