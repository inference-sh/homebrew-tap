class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.24/inferencesh-cli-v1.28.24-darwin-arm64.tar.gz"
      sha256 "2c904a8778bb505c3fce0e5a4b8c1579ecaa0dcf3df3671db7096271d75e2c71"
    else
      url "https://dist.inference.sh/cli/v1.28.24/inferencesh-cli-v1.28.24-darwin-amd64.tar.gz"
      sha256 "3c0f0be5f237b9915d96a68fb7b78ecc281f007a987b8117baf9164a78078318"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.24/inferencesh-cli-v1.28.24-linux-arm64.tar.gz"
      sha256 "752edcddad3c563ce522dddb7c16ef43b909e3af4ec714a240d98ab0de204b34"
    else
      url "https://dist.inference.sh/cli/v1.28.24/inferencesh-cli-v1.28.24-linux-amd64.tar.gz"
      sha256 "f7069f0958a9bac04850c581801bc1766f617ce5ba40622b807546d72d905060"
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
