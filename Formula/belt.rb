class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.17/inferencesh-cli-v1.29.17-darwin-arm64.tar.gz"
      sha256 "c91c135a6f978d6c7ca07f07f9bf320032a2f68127dca4fe9aeecffb0fc4c25b"
    else
      url "https://dist.inference.sh/cli/v1.29.17/inferencesh-cli-v1.29.17-darwin-amd64.tar.gz"
      sha256 "6c22cfe5cf9e6e7217ed4be1996fecc99087d122d8c618cc89466191484522e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.17/inferencesh-cli-v1.29.17-linux-arm64.tar.gz"
      sha256 "2fecf23cc75c38c2ad733092de31201bf5ef1a1ac8c26b5ef95a578b716d3e57"
    else
      url "https://dist.inference.sh/cli/v1.29.17/inferencesh-cli-v1.29.17-linux-amd64.tar.gz"
      sha256 "aa2a4f4e218a96fe17a499058ad2bc98411e7ac8bab07d18f5e7ba8e118cfe2d"
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
