class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.24.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.2/inferencesh-cli-v1.24.2-darwin-arm64.tar.gz"
      sha256 "8c3c55c8d509527806d7653af299a7d7b43a3f7fa0fb96e3301931baefaef295"
    else
      url "https://dist.inference.sh/cli/v1.24.2/inferencesh-cli-v1.24.2-darwin-amd64.tar.gz"
      sha256 "fbeaca870322b2b02bdb8cee35b154287b397bcde61151fd188ef1edb876d788"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.2/inferencesh-cli-v1.24.2-linux-arm64.tar.gz"
      sha256 "85e54ec0b235b48689d51466c6b136dc2b1629922ca6ccfb2588a1a86b1f00ab"
    else
      url "https://dist.inference.sh/cli/v1.24.2/inferencesh-cli-v1.24.2-linux-amd64.tar.gz"
      sha256 "f5cd4e762c2a164c1d86d3837cbb8d8f843e536edc613749ec8f8bed1a746997"
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
