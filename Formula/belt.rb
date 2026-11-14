class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.48"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.48/inferencesh-cli-v1.28.48-darwin-arm64.tar.gz"
      sha256 "348c56c15c1f968b3104b90368f7d2e752b0d3d3ba933f6b2d1e3eadf15d9266"
    else
      url "https://dist.inference.sh/cli/v1.28.48/inferencesh-cli-v1.28.48-darwin-amd64.tar.gz"
      sha256 "f6e43fe091676d7a9391e669742c9af6f55fe9256998cf036fe5d60184d07ef8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.48/inferencesh-cli-v1.28.48-linux-arm64.tar.gz"
      sha256 "da8fed0d7c65e676cd548116c37b92155e7d01269bca9e41456e82992dcd4776"
    else
      url "https://dist.inference.sh/cli/v1.28.48/inferencesh-cli-v1.28.48-linux-amd64.tar.gz"
      sha256 "0414f4964ab16713ca674f8ce13a176ed0a1fee2cd000b2d866b8a5aa0748f02"
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
