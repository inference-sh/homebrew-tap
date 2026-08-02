class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.16/inferencesh-cli-v1.16.16-darwin-arm64.tar.gz"
      sha256 "47e1de98b6ee8151475c05be10eb42eaf70548c273d7a0e29f7daafa448e60d5"
    else
      url "https://dist.inference.sh/cli/v1.16.16/inferencesh-cli-v1.16.16-darwin-amd64.tar.gz"
      sha256 "5902c0a8a67eb4d8b47b3f8dcab7aafbac7bef95a6161eaa240d57cb0b7da629"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.16/inferencesh-cli-v1.16.16-linux-arm64.tar.gz"
      sha256 "ce331e4bd42dff850f393f521eac7845cfe97b6121693e71fde2abb0ac711ed0"
    else
      url "https://dist.inference.sh/cli/v1.16.16/inferencesh-cli-v1.16.16-linux-amd64.tar.gz"
      sha256 "23ce673b623073f7bfdcfed8b44b55e734eff15fbca3b7479aff103b3f67bb39"
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
