class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.13-darwin-arm64.tar.gz"
      sha256 "83e0c1ec3274eedf8fd6136962cfe786c4c5f904f6354a52941a47a2554ccfd3"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.13-darwin-amd64.tar.gz"
      sha256 "f064ed3ae6e81c983561446a28d94150ed87b8ca36767f77513e0ad847e9f218"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.13-linux-arm64.tar.gz"
      sha256 "968f46eb970eeab3668f2263fda01d1f3b44eeeb055e2f75bfd8665f5ceebc62"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.13-linux-amd64.tar.gz"
      sha256 "d68d8ec2e3ff1a058b334855dd986ba25f75975ec2da13a5ad697838ffc828eb"
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
