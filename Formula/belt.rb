class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.27.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.27.0/inferencesh-cli-v1.27.0-darwin-arm64.tar.gz"
      sha256 "e7f2a40babdec067df756c1dc397ad14225081a20216c73ce96256666abe7d01"
    else
      url "https://dist.inference.sh/cli/v1.27.0/inferencesh-cli-v1.27.0-darwin-amd64.tar.gz"
      sha256 "e396f60b33e1851fca55aba08a9a03c62af55fc55998bb76cf5837bb3f678a64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.27.0/inferencesh-cli-v1.27.0-linux-arm64.tar.gz"
      sha256 "50351a58eced0054511367a4781f9aea660eae629d44711f5d999306f106faf9"
    else
      url "https://dist.inference.sh/cli/v1.27.0/inferencesh-cli-v1.27.0-linux-amd64.tar.gz"
      sha256 "ff44dd48595f8d0487ddd051168507bdca02d405d68704c83a73d5d6c8be0f2a"
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
