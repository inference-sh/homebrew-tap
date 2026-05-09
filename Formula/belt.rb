class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.0-darwin-arm64.tar.gz"
      sha256 "2b96460268a9f00567caa65558002c719b939327f449a7ec6830ce2b774b0f9c"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.0-darwin-amd64.tar.gz"
      sha256 "240efb43fbc923c53ed7e7dcc631a11a0621f1dc268dd1f1e279fd744bb186be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.0-linux-arm64.tar.gz"
      sha256 "c78da677ad5d4cdd43b3305f8082ab52a6f4bdbe52380934a44a8b6d3b9662db"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.0-linux-amd64.tar.gz"
      sha256 "20946e9310b6943b97becb93a4b73f76a245a6a780b0b2fe4818ea763c2aa15d"
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
