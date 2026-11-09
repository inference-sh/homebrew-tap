class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.28/inferencesh-cli-v1.28.28-darwin-arm64.tar.gz"
      sha256 "27bbdcbb63f5cd455b32437674989dc2219f1c73849662d00e7c733181cd5e5c"
    else
      url "https://dist.inference.sh/cli/v1.28.28/inferencesh-cli-v1.28.28-darwin-amd64.tar.gz"
      sha256 "5368c7b06e0ac74287f35179c701d3cfb8b36cfd4fc886f13f888748bff90f94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.28/inferencesh-cli-v1.28.28-linux-arm64.tar.gz"
      sha256 "98588832d14c572ba2dbe40ebf6513c49a2cc7dd70e3b60eff75bfe4f8d4f1fb"
    else
      url "https://dist.inference.sh/cli/v1.28.28/inferencesh-cli-v1.28.28-linux-amd64.tar.gz"
      sha256 "2a3aea4ad7dc3a28039a336c2fca09a0d855612c24a0bbc53e205d0d27b46805"
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
