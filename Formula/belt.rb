class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.1/inferencesh-cli-v1.29.1-darwin-arm64.tar.gz"
      sha256 "a43544a9b90fb2a0366369881e19f3896509007e37013a45c6c650c927d0026e"
    else
      url "https://dist.inference.sh/cli/v1.29.1/inferencesh-cli-v1.29.1-darwin-amd64.tar.gz"
      sha256 "ac3c55c51e5cc2c06c3c7a2a95746afcfb87a3b5e163855117b6ef9b42f36e23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.1/inferencesh-cli-v1.29.1-linux-arm64.tar.gz"
      sha256 "c5b64e88cc7ebc7104d7154b104dc99fe38eba1d40b87543eae294511b1d1a22"
    else
      url "https://dist.inference.sh/cli/v1.29.1/inferencesh-cli-v1.29.1-linux-amd64.tar.gz"
      sha256 "1f300ecd37bcb84af3554a2f63447223d5495a8ddbd02b01cfa9ebd1ef5586db"
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
