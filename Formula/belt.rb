class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.34"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.34/inferencesh-cli-v1.18.34-darwin-arm64.tar.gz"
      sha256 "81f5e79c557fa22c86eb29325b06c73fca73f6d91ec506c7f47a01d063882bb4"
    else
      url "https://dist.inference.sh/cli/v1.18.34/inferencesh-cli-v1.18.34-darwin-amd64.tar.gz"
      sha256 "eea40d85266d689684c820bd0455584fa7034c5408940af1390a66065355823b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.34/inferencesh-cli-v1.18.34-linux-arm64.tar.gz"
      sha256 "9fb357ef98da3443ffe703444aa8ff13a7ad06067277a367c37984d0636669e8"
    else
      url "https://dist.inference.sh/cli/v1.18.34/inferencesh-cli-v1.18.34-linux-amd64.tar.gz"
      sha256 "0d143c0a358c5c6586ecbefb7d00adba1b42aad7f5aad057d2293f237acc0f77"
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
