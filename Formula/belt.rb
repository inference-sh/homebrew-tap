class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.3/inferencesh-cli-v1.17.3-darwin-arm64.tar.gz"
      sha256 "828f1c6ec47f1dd8f58e7ce3f59dc7c7bf7526f095f03599cad068f0b9507a19"
    else
      url "https://dist.inference.sh/cli/v1.17.3/inferencesh-cli-v1.17.3-darwin-amd64.tar.gz"
      sha256 "16d446747a20b3d26bb3b7a5e22d3702eb0cebbdfca274ebc7e44fb9b80b22d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.3/inferencesh-cli-v1.17.3-linux-arm64.tar.gz"
      sha256 "b6c8901a44418e11888370b062358a5b008d5995720dc4ada3d1bbb7a294dd2d"
    else
      url "https://dist.inference.sh/cli/v1.17.3/inferencesh-cli-v1.17.3-linux-amd64.tar.gz"
      sha256 "591b7189828577d71e0ea6516aa46d8a4ff8821e4c4febd9379be925f14d4a5b"
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
