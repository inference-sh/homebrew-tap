class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.20/inferencesh-cli-v1.18.20-darwin-arm64.tar.gz"
      sha256 "dbdffa9ebeb67bf7d86558e7c8a7c8fd5b77943938b3eb794196bf99d9ec920b"
    else
      url "https://dist.inference.sh/cli/v1.18.20/inferencesh-cli-v1.18.20-darwin-amd64.tar.gz"
      sha256 "96d1dcaef4aeabbec63cd4e7f7b0046e6cac3d29acafb45989620c4eea0c1ee0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.20/inferencesh-cli-v1.18.20-linux-arm64.tar.gz"
      sha256 "6387dbb176cba5a76b8b25eedbd51bba669e89197f42ceb4c78cab6c14fa2c0d"
    else
      url "https://dist.inference.sh/cli/v1.18.20/inferencesh-cli-v1.18.20-linux-amd64.tar.gz"
      sha256 "a87e450072bed837185008e912e06e515084a3718c58b52a653f55a3ba1abdd3"
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
