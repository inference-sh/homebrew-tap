class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.15/inferencesh-cli-v1.17.15-darwin-arm64.tar.gz"
      sha256 "0941a5b3b4014856c6bae8954b51f7447461bea260f665cf0ebff9669a378a00"
    else
      url "https://dist.inference.sh/cli/v1.17.15/inferencesh-cli-v1.17.15-darwin-amd64.tar.gz"
      sha256 "a49a00379bbbe1a90ca512ec8b0cdf553719371ec42dbd1a3a968e05ebee2eb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.15/inferencesh-cli-v1.17.15-linux-arm64.tar.gz"
      sha256 "afc3524a7ba33c3990e7c94200b48a836d2cf01c3d4fd2dc84842513f574151d"
    else
      url "https://dist.inference.sh/cli/v1.17.15/inferencesh-cli-v1.17.15-linux-amd64.tar.gz"
      sha256 "72ef75c280c53759098ff3fbd828ff2dfbdc67ee21bce734d6bfcb110e0e193e"
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
