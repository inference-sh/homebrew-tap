class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.23.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.23.0/inferencesh-cli-v1.23.0-darwin-arm64.tar.gz"
      sha256 "9cc2b3236217a8c197bf0f5afcb81eab0948feb1ae7294d89a4d744a873c9e5b"
    else
      url "https://dist.inference.sh/cli/v1.23.0/inferencesh-cli-v1.23.0-darwin-amd64.tar.gz"
      sha256 "1bef8e76e27299e7cac6a60a55232b0ac8f6dea33f196a746f4a6470661e0449"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.23.0/inferencesh-cli-v1.23.0-linux-arm64.tar.gz"
      sha256 "5b0009ac843067069fdfcc7aff2384c81cf5ad6f8f3599c8ed99370fdf1138d4"
    else
      url "https://dist.inference.sh/cli/v1.23.0/inferencesh-cli-v1.23.0-linux-amd64.tar.gz"
      sha256 "54dac36e07db85c476bce4eed6fe68eeb0639f79f131cd77d9d2a56cb1a15d01"
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
