class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.30/inferencesh-cli-v1.15.30-darwin-arm64.tar.gz"
      sha256 "8671652fba6791425bfe1cd113a941737326f7c94f19aff66bd29a23b9a5b846"
    else
      url "https://dist.inference.sh/cli/v1.15.30/inferencesh-cli-v1.15.30-darwin-amd64.tar.gz"
      sha256 "e91f9d0f4287e285dda8502f3b469b3e1026efb6c701cb319decd17968e877db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.30/inferencesh-cli-v1.15.30-linux-arm64.tar.gz"
      sha256 "6ec10f656761ece96ffc20227af971cb86a70a9ef89ac3d8d8d671fb0558167f"
    else
      url "https://dist.inference.sh/cli/v1.15.30/inferencesh-cli-v1.15.30-linux-amd64.tar.gz"
      sha256 "9c8a514a0d2458401f4cd256e104aa7e9cb636b9dd6fab182bdaa7c6dd47b187"
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
