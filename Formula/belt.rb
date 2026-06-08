class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.29-darwin-arm64.tar.gz"
      sha256 "cde159359353f9a1ed96745d8dcb9d0bc0d0de1d4118c8175c981b50ce224079"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.29-darwin-amd64.tar.gz"
      sha256 "8df4ac634c4b1946d8f07a2d68980eac2e917e8f720823a5f31479619b0861aa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.29-linux-arm64.tar.gz"
      sha256 "ac0a2568f94eb45bd14f6b953021d9740603683655ddedddb89d99bcbdfe8aef"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.29-linux-amd64.tar.gz"
      sha256 "6df87fcc146901734b4f4b89f7028f996c21eed1da1f63455bb340b7fe2b4d80"
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
