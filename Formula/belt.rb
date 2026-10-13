class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.24.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.6/inferencesh-cli-v1.24.6-darwin-arm64.tar.gz"
      sha256 "682ec09eeaf09ff8721b3be5885db81c3dd5c761c71e556556ec24d3f407043a"
    else
      url "https://dist.inference.sh/cli/v1.24.6/inferencesh-cli-v1.24.6-darwin-amd64.tar.gz"
      sha256 "5ecc53abeee7658b856e06a8be153d6198eb1bbc2e9c4af1a803afc3d55833df"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.6/inferencesh-cli-v1.24.6-linux-arm64.tar.gz"
      sha256 "4292c4bfd8e763962f94ccce33a5a599e484b6c4d050fe973dc4f11dcc825766"
    else
      url "https://dist.inference.sh/cli/v1.24.6/inferencesh-cli-v1.24.6-linux-amd64.tar.gz"
      sha256 "8bd0fa6749ee53a5142501254c213ce67b38a207561e054913cfe5fe46d02cbb"
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
