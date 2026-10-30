class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.4/inferencesh-cli-v1.28.4-darwin-arm64.tar.gz"
      sha256 "f5284e111d47c45402cc97705e1cce10f393e77442493c3687d665b2807e86c4"
    else
      url "https://dist.inference.sh/cli/v1.28.4/inferencesh-cli-v1.28.4-darwin-amd64.tar.gz"
      sha256 "24c1a5da12c803747315eeda5814548b92e6568e4c07762eb6edc791946f34ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.4/inferencesh-cli-v1.28.4-linux-arm64.tar.gz"
      sha256 "91cfe85d7b9cef9254ba434e645418791e14114a2b6aa96d3e489aa126d60e35"
    else
      url "https://dist.inference.sh/cli/v1.28.4/inferencesh-cli-v1.28.4-linux-amd64.tar.gz"
      sha256 "2a1c61dffb875a2518191f5ec58efd4283dfc500dcc2b3573a79d595e1428c59"
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
