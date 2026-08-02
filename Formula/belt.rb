class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.16/inferencesh-cli-v1.16.16-darwin-arm64.tar.gz"
      sha256 "8c8ba9e99a3cc6faf4ea33513b71a3a7c6d511224552857f9d5f81621aea2040"
    else
      url "https://dist.inference.sh/cli/v1.16.16/inferencesh-cli-v1.16.16-darwin-amd64.tar.gz"
      sha256 "d48f578ff92ff5d3634c8bad9818e8b934ebb77ba5d187a81572f276d7799005"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.16/inferencesh-cli-v1.16.16-linux-arm64.tar.gz"
      sha256 "586a3633d593dd073d90ac63c05b7c0a83bb18bfc6116332819e0cee2e530123"
    else
      url "https://dist.inference.sh/cli/v1.16.16/inferencesh-cli-v1.16.16-linux-amd64.tar.gz"
      sha256 "d2486f453b85d6ba223db77d6c5cbbc34e838bb0bf72eb46847db57979ea50cb"
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
