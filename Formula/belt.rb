class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.11/inferencesh-cli-v1.26.11-darwin-arm64.tar.gz"
      sha256 "b8e9e068f0c713035b0ed2fd0cd80fc127daecc7659b414708b5097c371ee252"
    else
      url "https://dist.inference.sh/cli/v1.26.11/inferencesh-cli-v1.26.11-darwin-amd64.tar.gz"
      sha256 "13050ea9746ac2679a64adbf302a24303e265e4477a9b12c7a5982c43a089de8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.11/inferencesh-cli-v1.26.11-linux-arm64.tar.gz"
      sha256 "26c43143c06324d589025b65b9c24c4542482e6bd544dae4f3dad7a26a1a2128"
    else
      url "https://dist.inference.sh/cli/v1.26.11/inferencesh-cli-v1.26.11-linux-amd64.tar.gz"
      sha256 "1d60e8af783a86f5adc92c4a2f64c4961119cee1e70a39ce80aa1899c170c5f5"
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
