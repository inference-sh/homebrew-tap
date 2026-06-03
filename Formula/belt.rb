class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.15-darwin-arm64.tar.gz"
      sha256 "f9d294cf0ba6a995054abf720b3dccda42f9a05bc97ccd4b476f82e5f6efc5ff"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.15-darwin-amd64.tar.gz"
      sha256 "97d3d0adb76f121724ade5a49107487d78339949d73103be673196ab8c269593"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.15-linux-arm64.tar.gz"
      sha256 "e9926b7379ffa8d58d10890943e020ed70833f9d6039422998f2e79d3e0e0ca1"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.15-linux-amd64.tar.gz"
      sha256 "a3e4240572976af376520b2e7ce2c9a843f9d133586182aa27eb333a5a34b3a6"
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
