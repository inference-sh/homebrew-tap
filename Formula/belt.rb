class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.15-3-gfbe0692"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.15-3-gfbe0692/inferencesh-cli-v1.16.15-3-gfbe0692-darwin-arm64.tar.gz"
      sha256 "f7af17f39a9ca90c2ef644d1d0fa11c0a2b4936ba93766f474001833029e5d17"
    else
      url "https://dist.inference.sh/cli/v1.16.15-3-gfbe0692/inferencesh-cli-v1.16.15-3-gfbe0692-darwin-amd64.tar.gz"
      sha256 "29a58590a3da88c918563839e50dd30a56ef130a39674826321c0345649b5ba8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.15-3-gfbe0692/inferencesh-cli-v1.16.15-3-gfbe0692-linux-arm64.tar.gz"
      sha256 "c9d3fb0c618870c5660f06b9fe9ae1173df7ea6696c4635b38474a736af10070"
    else
      url "https://dist.inference.sh/cli/v1.16.15-3-gfbe0692/inferencesh-cli-v1.16.15-3-gfbe0692-linux-amd64.tar.gz"
      sha256 "f1b7d6a33c7108169e3d15da65ccbd88d5f10a0ae131b0b63179f46d800fe031"
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
