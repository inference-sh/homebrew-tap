class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.24/inferencesh-cli-v1.19.24-darwin-arm64.tar.gz"
      sha256 "8fe25ad23d6ee5913a9f623eb700623a66fcee6ac2c4b9ca85040da60884ae1e"
    else
      url "https://dist.inference.sh/cli/v1.19.24/inferencesh-cli-v1.19.24-darwin-amd64.tar.gz"
      sha256 "185e2546217fc8c3f6baaf590434809c20e35461990cd86a2aa4df5053d40c4c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.24/inferencesh-cli-v1.19.24-linux-arm64.tar.gz"
      sha256 "0e7fdf42b600059b86bbdc773d889e6191286c6368aba398e8ed5e9b32f32dd8"
    else
      url "https://dist.inference.sh/cli/v1.19.24/inferencesh-cli-v1.19.24-linux-amd64.tar.gz"
      sha256 "41e0538a6d2d19af4cac5e2f8674472266edf74f49f84529ab0a3422ac467bc4"
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
