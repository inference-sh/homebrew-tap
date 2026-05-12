class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.6-darwin-arm64.tar.gz"
      sha256 "e32b78f3d64f773410718cba345efefddfee66d19bc1e26d6f2ad838d8427327"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.6-darwin-amd64.tar.gz"
      sha256 "fa24c724a4d7cc9e60ea0dcf2e03c4dedaa4ceb8622a6bcde6516477137a28c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.6-linux-arm64.tar.gz"
      sha256 "b9e7daac699d1999c76b28c40bd5ad1211718abb7a6852d5452b756bec7a8c4c"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.6-linux-amd64.tar.gz"
      sha256 "b00db25ba0c5a6251dc16f43a23918212fa793a1ebbb7f46d696e8876429b260"
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
