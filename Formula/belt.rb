class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.13/inferencesh-cli-v1.28.13-darwin-arm64.tar.gz"
      sha256 "f003ecdceb484b5063feada2d81f72a8e4b666c6f872d333a38bdb061ca604f4"
    else
      url "https://dist.inference.sh/cli/v1.28.13/inferencesh-cli-v1.28.13-darwin-amd64.tar.gz"
      sha256 "3fa4f6a6a92b92af8828f76b57b3edb4281cdbe61565400966f495dc8262cd9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.13/inferencesh-cli-v1.28.13-linux-arm64.tar.gz"
      sha256 "06edf30dfb9adeec99ae11f271fd01efa415b8ad291f46aea1d4fe07d0f7f2d7"
    else
      url "https://dist.inference.sh/cli/v1.28.13/inferencesh-cli-v1.28.13-linux-amd64.tar.gz"
      sha256 "43a400702e9a45d77f5257c4c61063a6b2e1859bcaa71ce354b2eae9cbcad9c5"
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
