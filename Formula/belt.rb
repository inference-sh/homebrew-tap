class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.41"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.41/inferencesh-cli-v1.28.41-darwin-arm64.tar.gz"
      sha256 "9add6f4154482837c00a51f04fbf0cd58aacf65b1fe55f69f11a0147bbc9c4a1"
    else
      url "https://dist.inference.sh/cli/v1.28.41/inferencesh-cli-v1.28.41-darwin-amd64.tar.gz"
      sha256 "9dd915f7d5cb539a22d7e19d30842ac88e19b630cf3d7b2620ae9854900e22fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.41/inferencesh-cli-v1.28.41-linux-arm64.tar.gz"
      sha256 "c9dbfe6e911b9907e7bee97492433ff76601ea82a93b8c4a43b4756a7126d7f5"
    else
      url "https://dist.inference.sh/cli/v1.28.41/inferencesh-cli-v1.28.41-linux-amd64.tar.gz"
      sha256 "1cb76a0921655631bed8ccd9dfb3aa692c8211b1c65ec4a9af339fc9d9313e3e"
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
