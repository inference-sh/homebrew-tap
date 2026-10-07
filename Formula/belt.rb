class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.21/inferencesh-cli-v1.19.21-darwin-arm64.tar.gz"
      sha256 "0ad11d5d6a66c855d5329d497e4b7c0923528d62fea5807dc076b1802f00344b"
    else
      url "https://dist.inference.sh/cli/v1.19.21/inferencesh-cli-v1.19.21-darwin-amd64.tar.gz"
      sha256 "830bc4b274a77604c3037655b7de9c293ad787c480bcd9897121be7ff3cf7b0f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.21/inferencesh-cli-v1.19.21-linux-arm64.tar.gz"
      sha256 "64752a7dd9c0b677c9920dc3c5dcc110645340dc2259fbabbe197c43a9fb41f1"
    else
      url "https://dist.inference.sh/cli/v1.19.21/inferencesh-cli-v1.19.21-linux-amd64.tar.gz"
      sha256 "3cd1fffb0250c9d53a774b83a01c1b9e1c4d53534f38bfcde55715391642ac4d"
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
