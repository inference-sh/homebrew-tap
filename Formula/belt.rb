class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.32-darwin-arm64.tar.gz"
      sha256 "42c421043f62cc4067ef8d33dbd061e7376f0a63efd223fed71abb68f2300988"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.32-darwin-amd64.tar.gz"
      sha256 "1685549abaa4e2d338965778f6b6bc19937a6db311f992ad0241ed5e4c2b6308"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.32-linux-arm64.tar.gz"
      sha256 "bcf13eaebcea5b9186a68d9d3fc87ed9a22d2b23e07982fc2d013f2ebd0f80e0"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.32-linux-amd64.tar.gz"
      sha256 "3cda3d2eddfcaeb98eed21c98150c99711dde9c13c65cd09e5e475aa0bae576a"
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
