class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.17/inferencesh-cli-v1.26.17-darwin-arm64.tar.gz"
      sha256 "a358e2385eeb6c29af39014a9ee3366b545ef9fdb153ff527ae2efe424f7c47e"
    else
      url "https://dist.inference.sh/cli/v1.26.17/inferencesh-cli-v1.26.17-darwin-amd64.tar.gz"
      sha256 "1a4ce5a6ca9c35eac59cb027d6534200310bec6b0e4890cd6f81a4ce5117a51b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.17/inferencesh-cli-v1.26.17-linux-arm64.tar.gz"
      sha256 "72215fb10866f1d74955012f968c1f3b22cad9b6086f06b77588cd5b1fc7467d"
    else
      url "https://dist.inference.sh/cli/v1.26.17/inferencesh-cli-v1.26.17-linux-amd64.tar.gz"
      sha256 "9e1634d40c7191b442cb76f97ecdef312644c8ceacfde74904a0aed10a21c41d"
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
