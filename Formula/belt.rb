class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.26/inferencesh-cli-v1.16.26-darwin-arm64.tar.gz"
      sha256 "81a28d1a42f44dba72f73821e6fc20b27c2fa32aac1328b2e2694fc7e8124c63"
    else
      url "https://dist.inference.sh/cli/v1.16.26/inferencesh-cli-v1.16.26-darwin-amd64.tar.gz"
      sha256 "21f59420b391547b07c5f5ca611db6e88fda50a337bbc1860961a9d6a8fd1359"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.26/inferencesh-cli-v1.16.26-linux-arm64.tar.gz"
      sha256 "9ad1a4fe48da284e5a35bd650a2754598633cfeab73f0d3b43d4d37a7248e128"
    else
      url "https://dist.inference.sh/cli/v1.16.26/inferencesh-cli-v1.16.26-linux-amd64.tar.gz"
      sha256 "4adfe2927a11b97037d2c7f4622531e840319e21b3b0195ef3a3fa611896ebd6"
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
