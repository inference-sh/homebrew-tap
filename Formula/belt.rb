class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.9/inferencesh-cli-v1.17.9-darwin-arm64.tar.gz"
      sha256 "3cc41afbef4561895421b07df0b9bdf41f90f2c8ee60c58f0401b7664d5e7d44"
    else
      url "https://dist.inference.sh/cli/v1.17.9/inferencesh-cli-v1.17.9-darwin-amd64.tar.gz"
      sha256 "5717d62c11b06b1fe5034580640427f4f8b55df7502ee116812128e7bce733a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.9/inferencesh-cli-v1.17.9-linux-arm64.tar.gz"
      sha256 "08fe58cae7250fdbf7fb056f9fe3d65a9ceab4c1f0148f9b98f45bdfae02512c"
    else
      url "https://dist.inference.sh/cli/v1.17.9/inferencesh-cli-v1.17.9-linux-amd64.tar.gz"
      sha256 "a88e458e5ecd2e48ed8d7c2d97b597f88ce13fec0660994e1ab2852a223e5e80"
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
