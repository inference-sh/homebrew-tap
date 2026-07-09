class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.14.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.18/inferencesh-cli-v1.14.18-darwin-arm64.tar.gz"
      sha256 "7046339b7bcec912316408a25c77f1bce43a8112e8b9e9fb627c23d137f2c620"
    else
      url "https://dist.inference.sh/cli/v1.14.18/inferencesh-cli-v1.14.18-darwin-amd64.tar.gz"
      sha256 "177171b43e41cd9cb1d119ca2698a63b6b7d782c1a609b2e669c7d6acc8a5229"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.18/inferencesh-cli-v1.14.18-linux-arm64.tar.gz"
      sha256 "81601f47dbb0ababcc8a713db1d61ded95132d26282211da2426349c8f1167a1"
    else
      url "https://dist.inference.sh/cli/v1.14.18/inferencesh-cli-v1.14.18-linux-amd64.tar.gz"
      sha256 "8f9900a8f567284264ef2e2210db4ebf5eda9c35b1e4030acd7154c56e9fa3c0"
    end
  end

  def install
    binary = Dir["inferencesh-cli-*"].first
    bin.install binary => "belt"
    bin.install_symlink "belt" => "infsh"
    bin.install_symlink "belt" => "inferencesh"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/belt version")
  end
end
