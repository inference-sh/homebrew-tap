class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.22.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.22.1/inferencesh-cli-v1.22.1-darwin-arm64.tar.gz"
      sha256 "8befe39bee3d659ca8ce136e2b5333da18200a72606c110de9f39960382da573"
    else
      url "https://dist.inference.sh/cli/v1.22.1/inferencesh-cli-v1.22.1-darwin-amd64.tar.gz"
      sha256 "e6f880afaa3fb9b0517381571e16c25144973693cceeaabdf8615f3c9edf3545"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.22.1/inferencesh-cli-v1.22.1-linux-arm64.tar.gz"
      sha256 "80884558602bb33cb17a066674816a74c7e81b3479287bbca9565ebaca8d64bb"
    else
      url "https://dist.inference.sh/cli/v1.22.1/inferencesh-cli-v1.22.1-linux-amd64.tar.gz"
      sha256 "8817c43929fc3119d1d0c2c0f7e2fd2eeea09557f4228a07598e10c5f1625935"
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
