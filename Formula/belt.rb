class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.0/inferencesh-cli-v1.29.0-darwin-arm64.tar.gz"
      sha256 "14a5358aa834a1dfec0a5b6383be99e372bc6b0b17797ae879e0d3b3c93732ad"
    else
      url "https://dist.inference.sh/cli/v1.29.0/inferencesh-cli-v1.29.0-darwin-amd64.tar.gz"
      sha256 "cdf049394bc618e8fab22ccd62f75b74e008d07974c81a0bb179c90ad12f9f41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.0/inferencesh-cli-v1.29.0-linux-arm64.tar.gz"
      sha256 "cddc0fd72604cb278ab8603456a98b37008e1038fa039a103e9f5dafc1ecd00f"
    else
      url "https://dist.inference.sh/cli/v1.29.0/inferencesh-cli-v1.29.0-linux-amd64.tar.gz"
      sha256 "f43f4ccc4011bce525fc24d6b2e24017013fb91e5de77036626c159276c925ee"
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
