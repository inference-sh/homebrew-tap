class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.23/inferencesh-cli-v1.19.23-darwin-arm64.tar.gz"
      sha256 "3c4f1cbb355269bf2c8c5b4bc49b51a6dbc92b8a98dc399d1cce6c71ea32158c"
    else
      url "https://dist.inference.sh/cli/v1.19.23/inferencesh-cli-v1.19.23-darwin-amd64.tar.gz"
      sha256 "41b97c80f9432a925c4516cf4577fc025415a373bdab5e4dae8aae1153ef2491"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.23/inferencesh-cli-v1.19.23-linux-arm64.tar.gz"
      sha256 "89ac5b71c7f57ccedf80f0b3b8f927ee0e335bfcc6e26d10ba22dfac959d5751"
    else
      url "https://dist.inference.sh/cli/v1.19.23/inferencesh-cli-v1.19.23-linux-amd64.tar.gz"
      sha256 "1267ffc5f6f6ab985f1bf92e57614bad310d198f62a0840ad95367277865db02"
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
