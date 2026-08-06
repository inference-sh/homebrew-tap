class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.8/inferencesh-cli-v1.17.8-darwin-arm64.tar.gz"
      sha256 "4c9fd03a92e41fe3c04836683be104880f8a5a739e77f076ba490058f4807aa5"
    else
      url "https://dist.inference.sh/cli/v1.17.8/inferencesh-cli-v1.17.8-darwin-amd64.tar.gz"
      sha256 "12a4e26bbf682386b75ef10895c33c6c2e7f28f573408c133fcff20f3a114c01"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.8/inferencesh-cli-v1.17.8-linux-arm64.tar.gz"
      sha256 "88af47252203e9e95efb38f57a4351c9ac3ebffa3faa0c2087f8fc911a249a43"
    else
      url "https://dist.inference.sh/cli/v1.17.8/inferencesh-cli-v1.17.8-linux-amd64.tar.gz"
      sha256 "7068d0a64d6a5381a4c641f7ce8bddbfef6fc49a9b53ac0e0cf95f08910e977d"
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
