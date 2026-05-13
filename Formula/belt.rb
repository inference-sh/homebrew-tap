class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.11-darwin-arm64.tar.gz"
      sha256 "68de04b27be2070311cccbc1de7d2515008ec188d574016ce377098cc248fe89"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.11-darwin-amd64.tar.gz"
      sha256 "d2646041ef4f8b36e43a3a5021f9f8b5e5a45977643689ec6f062def959ce4d3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.11-linux-arm64.tar.gz"
      sha256 "06617e768a888c9b1651332399d150225e47b7bfa102fb01ef2cb165d41de0d3"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.11-linux-amd64.tar.gz"
      sha256 "1d32a50764cf8e864e5b4b80ed6fc518a02443c79af823f0429fd77aeb6743d8"
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
