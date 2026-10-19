class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.2/inferencesh-cli-v1.26.2-darwin-arm64.tar.gz"
      sha256 "e6dd97d32e45d3a57bfda62b65c99ee2d8f1c7ff49ab1ca4077f3e8924364728"
    else
      url "https://dist.inference.sh/cli/v1.26.2/inferencesh-cli-v1.26.2-darwin-amd64.tar.gz"
      sha256 "5fc24f515fb2e86e842063e800f6379955b5faedc3a61f86217fd4a15b8828e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.2/inferencesh-cli-v1.26.2-linux-arm64.tar.gz"
      sha256 "3a9dfc4753aed8fcbf4c746de06bdaff8ee00bb069aa19df9dcd49b828af4c4d"
    else
      url "https://dist.inference.sh/cli/v1.26.2/inferencesh-cli-v1.26.2-linux-amd64.tar.gz"
      sha256 "4f1782785dc72c7508b96284c479dd6f5495e422404c6bb2cdf95f55814538ed"
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
