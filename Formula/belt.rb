class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.32-darwin-arm64.tar.gz"
      sha256 "5b53c3bd8a3621db457ab037f448b30ecbab997816847c8ea9d72caed7b5b8df"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.32-darwin-amd64.tar.gz"
      sha256 "2e2af981674a6a775bfbcd1d1b4c04a072301927ac6ad26064145567c82428c9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.32-linux-arm64.tar.gz"
      sha256 "2d47bd26aaef602319a9522db77495ec85b0d729a516eb32e312da8cbdec7716"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.32-linux-amd64.tar.gz"
      sha256 "665ec3d998bec9a40790bd0fb7d8f06ae2456a598e824fb08a5c3e94ac17b855"
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
