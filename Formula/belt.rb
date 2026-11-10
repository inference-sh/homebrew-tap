class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.30/inferencesh-cli-v1.28.30-darwin-arm64.tar.gz"
      sha256 "3ecb1cb4dfd9e2daee9637e441d1f6c00fb1be1a2918a4a5026b906a9929db09"
    else
      url "https://dist.inference.sh/cli/v1.28.30/inferencesh-cli-v1.28.30-darwin-amd64.tar.gz"
      sha256 "516d1c0e8a4a66c26bbdb842c05519164cc627e7947ed7cdc2a3537bf71b8c0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.30/inferencesh-cli-v1.28.30-linux-arm64.tar.gz"
      sha256 "26aa014bd76595b910738e0eb54c912067fcad77a61c8d1148295c60ee368c36"
    else
      url "https://dist.inference.sh/cli/v1.28.30/inferencesh-cli-v1.28.30-linux-amd64.tar.gz"
      sha256 "98148aa77ef12faab828c03210042dcb0d1cc72f959cc7cc83c5e392fab501b3"
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
