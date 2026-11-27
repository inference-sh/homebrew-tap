class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.20/inferencesh-cli-v1.29.20-darwin-arm64.tar.gz"
      sha256 "55a98f369f8a54ac5205ff71a5a1d4261aef1ae221f0522f92a6fffdd9117228"
    else
      url "https://dist.inference.sh/cli/v1.29.20/inferencesh-cli-v1.29.20-darwin-amd64.tar.gz"
      sha256 "4dde8d8dbc7cc48e8432e9172237c4b93e46b860b1377313091c599590cd94a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.20/inferencesh-cli-v1.29.20-linux-arm64.tar.gz"
      sha256 "7ae670d1e52595cb1a008aeaf7c20d56499d8682556655a23f8520990282cf17"
    else
      url "https://dist.inference.sh/cli/v1.29.20/inferencesh-cli-v1.29.20-linux-amd64.tar.gz"
      sha256 "c56d71d14c4801d4e03fda0c9cb1cab91b120598ef3cb39a7fc4ee970766bd5b"
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
