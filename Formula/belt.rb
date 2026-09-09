class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.29/inferencesh-cli-v1.18.29-darwin-arm64.tar.gz"
      sha256 "f51070cea580c50d1d10bb97c96f7339a421416c39a1a41c356ffff1ce49bd58"
    else
      url "https://dist.inference.sh/cli/v1.18.29/inferencesh-cli-v1.18.29-darwin-amd64.tar.gz"
      sha256 "2624b0fc4d94bb2984d212c6a0a251297fbc0ffdb6095e4a7fe0a8679f4d5a23"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.29/inferencesh-cli-v1.18.29-linux-arm64.tar.gz"
      sha256 "dc04d896fe297a1c00521ce751476d3c09e5ba97c6db02d0e4f4be25df7c823f"
    else
      url "https://dist.inference.sh/cli/v1.18.29/inferencesh-cli-v1.18.29-linux-amd64.tar.gz"
      sha256 "a788279ad60f87cc7b9f0d50c45a652d7179b3d23e32ff18ae018e656ee48b9a"
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
