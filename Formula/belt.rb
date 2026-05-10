class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.2-darwin-arm64.tar.gz"
      sha256 "6c686e9e21af90f86e5ce81c83622112b3e8b6efa15df89fa2a381f2b7a15672"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.2-darwin-amd64.tar.gz"
      sha256 "772b37e0f6916115be46a426b1f0c442f080e73ce9a1f28cdc33cf8c27cd04ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.2-linux-arm64.tar.gz"
      sha256 "f4052c2c64b26141d11e2d18e9d16b787edab808f63329b3fded003039fffe9d"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.2-linux-amd64.tar.gz"
      sha256 "b3da91778bc1ea539e9881648bc9164d4b69620864997c2d926ca3b44bcd6886"
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
