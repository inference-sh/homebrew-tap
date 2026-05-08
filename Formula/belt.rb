class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.0-darwin-arm64.tar.gz"
      sha256 "5f7910b7ea769c0abb788b626cb1f68896ff1c912077e3862a8679733ed5c227"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.0-darwin-amd64.tar.gz"
      sha256 "19f5e37e1952ab14cf2a25068f953c757bb24237263511c52e7a74a0da1cce26"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.0-linux-arm64.tar.gz"
      sha256 "3ac8697082356ea3311ac178719a79481f123713eb61cb8a0445bf6e73980889"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.0-linux-amd64.tar.gz"
      sha256 "8d36e4bba97e10c4e7d3ea209e8a862c429bd90c9b68904c7cf1d02f545b3fe3"
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
