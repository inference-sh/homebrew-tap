class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.0/inferencesh-cli-v1.15.0-darwin-arm64.tar.gz"
      sha256 "65a7525702dcbf03e325d792560e3c36515e3b1fcdff689da9c3853541c8ba90"
    else
      url "https://dist.inference.sh/cli/v1.15.0/inferencesh-cli-v1.15.0-darwin-amd64.tar.gz"
      sha256 "e292bd81e62afbc9219cd96e3aeed84d2627bb019f6115a760a444045687b190"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.0/inferencesh-cli-v1.15.0-linux-arm64.tar.gz"
      sha256 "74d522ae20379784e537b5c1cb24288f3ecbb15d2a0292dffd9d6fae0b75768b"
    else
      url "https://dist.inference.sh/cli/v1.15.0/inferencesh-cli-v1.15.0-linux-amd64.tar.gz"
      sha256 "9409860ae92b9f28ed9bbea79b6922a63d40e4164824b92f0eaab32cc28af378"
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
