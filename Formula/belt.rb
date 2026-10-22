class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.13/inferencesh-cli-v1.26.13-darwin-arm64.tar.gz"
      sha256 "09413df1bf67e0832e5b52ca7e3d2c0c5ecf1df6ae2d0b4314f9bbc7760309f9"
    else
      url "https://dist.inference.sh/cli/v1.26.13/inferencesh-cli-v1.26.13-darwin-amd64.tar.gz"
      sha256 "946b2687fd903fdaa167b12da3230e70f1b12e2bb02a5f9715884be42cd8f436"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.13/inferencesh-cli-v1.26.13-linux-arm64.tar.gz"
      sha256 "986ecc6172c85bec224f31e6c5951e1fa6ba3e7766d76325a33c12d6eae23fd2"
    else
      url "https://dist.inference.sh/cli/v1.26.13/inferencesh-cli-v1.26.13-linux-amd64.tar.gz"
      sha256 "f112cee2a7182c8b74494c56256168aa5896188f7aad8c1cfe4486d009860840"
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
