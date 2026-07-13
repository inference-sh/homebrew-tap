class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.6/inferencesh-cli-v1.15.6-darwin-arm64.tar.gz"
      sha256 "f68c0dec7855a72ba0c23c3f9d78e920d86fb9b0ffb047bd8fae4b13e98ad6b1"
    else
      url "https://dist.inference.sh/cli/v1.15.6/inferencesh-cli-v1.15.6-darwin-amd64.tar.gz"
      sha256 "e35b995fafba95b6e0d9a77673b44d11ba6da7bc5f1ca0820d717a7ef0d1bc02"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.6/inferencesh-cli-v1.15.6-linux-arm64.tar.gz"
      sha256 "05cd11ada203db1ed37d79a47820a59b4ed7fc2f5e65212e113392951f4a968f"
    else
      url "https://dist.inference.sh/cli/v1.15.6/inferencesh-cli-v1.15.6-linux-amd64.tar.gz"
      sha256 "162200b3a3b55c2bf377d3fb8b3849b043661010ff89d70fb667300d61e408fa"
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
