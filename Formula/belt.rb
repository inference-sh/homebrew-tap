class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.14.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.10-darwin-arm64.tar.gz"
      sha256 "46a7cec625694ea96b8a75cdfadc25325478961e364a40fd4e7b119becce2aa7"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.10-darwin-amd64.tar.gz"
      sha256 "e80f950c799dd14c6dcf85e6341e69df27b1f0a76c668121f349ef87cbc78df2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.10-linux-arm64.tar.gz"
      sha256 "422de7fe977532765167f3fc730edcccc2fd131c50d5e9105d96781421af2d9f"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.10-linux-amd64.tar.gz"
      sha256 "553253969164117e2e9d7bf165f64d0a6552d53f63d820d753a9cae590cf59a4"
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
