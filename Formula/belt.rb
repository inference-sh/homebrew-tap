class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.11/inferencesh-cli-v1.19.11-darwin-arm64.tar.gz"
      sha256 "25f0ecb09ee37c301db9490956caa40134505ed137b0d0c4087782b48fcf8e3a"
    else
      url "https://dist.inference.sh/cli/v1.19.11/inferencesh-cli-v1.19.11-darwin-amd64.tar.gz"
      sha256 "8e2572544711ce0a67304c00c2c8f19bb45c2ab79af190a6bdf58a676efb5e11"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.11/inferencesh-cli-v1.19.11-linux-arm64.tar.gz"
      sha256 "b2cc7ca2ef53cc564f9f417d9192d60b52d4f36997bd7a44a4082c12119c24c5"
    else
      url "https://dist.inference.sh/cli/v1.19.11/inferencesh-cli-v1.19.11-linux-amd64.tar.gz"
      sha256 "4c82957fb930e9b495e566cd99ed7594c9be0aa84b48938f130db365361aa847"
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
