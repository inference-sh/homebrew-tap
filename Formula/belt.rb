class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.46"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.46/inferencesh-cli-v1.18.46-darwin-arm64.tar.gz"
      sha256 "98bb2f5653c03a352f7a97003a094a0d221796114de18d9b0a79b4fd7cc40149"
    else
      url "https://dist.inference.sh/cli/v1.18.46/inferencesh-cli-v1.18.46-darwin-amd64.tar.gz"
      sha256 "c12f7623e3a852c716ff4046246b3c081de5e6ea668078864be4c580c25de71c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.46/inferencesh-cli-v1.18.46-linux-arm64.tar.gz"
      sha256 "a7e1025c34a991990920920aed5ae48d1ee01c69a2807f616e3be0e495effc51"
    else
      url "https://dist.inference.sh/cli/v1.18.46/inferencesh-cli-v1.18.46-linux-amd64.tar.gz"
      sha256 "50e9b8f36ae14975a9fcbd994dc93e4ecc72d862b00ea59524eb9c504c630eb4"
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
