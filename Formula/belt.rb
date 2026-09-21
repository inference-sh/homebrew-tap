class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.52"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.52/inferencesh-cli-v1.18.52-darwin-arm64.tar.gz"
      sha256 "472c70d93bb9c34703dff3994ccb17b3560989cab26cb360ddd23edaa672b23c"
    else
      url "https://dist.inference.sh/cli/v1.18.52/inferencesh-cli-v1.18.52-darwin-amd64.tar.gz"
      sha256 "fdd907bc46533e723dd16c75dc8c04bc51a1de01facf0e961cf961e1123c548d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.52/inferencesh-cli-v1.18.52-linux-arm64.tar.gz"
      sha256 "cec2027cc772d6418d264dd4b8b404b60c6c6dd156ea1818cc519f158504cd9c"
    else
      url "https://dist.inference.sh/cli/v1.18.52/inferencesh-cli-v1.18.52-linux-amd64.tar.gz"
      sha256 "1cbed2218bef1a2f341ab3b2645312f0004b51bbdbdb65d5aa533bef69e72e9a"
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
