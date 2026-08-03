class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.25/inferencesh-cli-v1.16.25-darwin-arm64.tar.gz"
      sha256 "33555e8cbc95f747e7cebfcd33db1383e8d174ba8aab184528c7fe60fd02907f"
    else
      url "https://dist.inference.sh/cli/v1.16.25/inferencesh-cli-v1.16.25-darwin-amd64.tar.gz"
      sha256 "3ee8b746010519501027b658613a59eb2935232247defa4a2ac6c8fd37c37897"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.25/inferencesh-cli-v1.16.25-linux-arm64.tar.gz"
      sha256 "6f1edeed28d13f71df2ec29070f50a2d377e9f0e963dd049c5664b2964b15066"
    else
      url "https://dist.inference.sh/cli/v1.16.25/inferencesh-cli-v1.16.25-linux-amd64.tar.gz"
      sha256 "d6dbb59bd88fd32e97648d96d00a92a92c7fe6e06fad8577749408c91db09caa"
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
