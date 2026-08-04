class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.1/inferencesh-cli-v1.17.1-darwin-arm64.tar.gz"
      sha256 "64fd00f9c7a2538f47df3d065dddcb1dda458c11b41c8c95581e6f20077095b2"
    else
      url "https://dist.inference.sh/cli/v1.17.1/inferencesh-cli-v1.17.1-darwin-amd64.tar.gz"
      sha256 "b9e045d01e41197f35076eb45c4055bfe944a4c146416c10dfb7436115a5ac88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.1/inferencesh-cli-v1.17.1-linux-arm64.tar.gz"
      sha256 "2b13374e5fe6aa1a403d79e3f3f1b3a083bb59f812b331f8f8cc47e0979959b7"
    else
      url "https://dist.inference.sh/cli/v1.17.1/inferencesh-cli-v1.17.1-linux-amd64.tar.gz"
      sha256 "08b9ce3f9a7ebc9ffa7f589c41897cd61592735ea29ea1f3a9e8147e594249dc"
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
