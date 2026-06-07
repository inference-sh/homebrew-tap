class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.24-darwin-arm64.tar.gz"
      sha256 "1413e7691db767f45c93268f3515b8470464790fe155b3c68d80e41b5cb9c2e2"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.24-darwin-amd64.tar.gz"
      sha256 "37b04407bbebe1d1e73b22dc2e7cd37b0dcc8afdd3d8a0c6d07a66d3599807db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.24-linux-arm64.tar.gz"
      sha256 "838a8bafa4aa661439fe3d7050a588a1d6ba55938794e6fc151d518f07049ef7"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.24-linux-amd64.tar.gz"
      sha256 "1a488d480651ef74065a3b4b1870cc42d1876a64a29414fd8619a94b25c019a0"
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
