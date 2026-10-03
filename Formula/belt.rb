class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.9/inferencesh-cli-v1.19.9-darwin-arm64.tar.gz"
      sha256 "6f09748ce2f0f9792a5bbc61b521a6cdb14b576d73e6ec078c2f3b7194972cd9"
    else
      url "https://dist.inference.sh/cli/v1.19.9/inferencesh-cli-v1.19.9-darwin-amd64.tar.gz"
      sha256 "1e554a72f5816b904a3067ad659251b5f02385b7bda162929531e7e05ae337e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.9/inferencesh-cli-v1.19.9-linux-arm64.tar.gz"
      sha256 "ecf6862d373e1060802d76c4829c3a7ab9fa7c515f85c394579d695175c46671"
    else
      url "https://dist.inference.sh/cli/v1.19.9/inferencesh-cli-v1.19.9-linux-amd64.tar.gz"
      sha256 "42fd9217135d7b77c0a8fe70122f4bc47a8913a99017a847857d033773704bc0"
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
