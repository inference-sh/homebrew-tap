class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.24/inferencesh-cli-v1.18.24-darwin-arm64.tar.gz"
      sha256 "935586327c13e1fbff1215be0351e5aa4edc1960ac8041688abd8a9ea34b7c89"
    else
      url "https://dist.inference.sh/cli/v1.18.24/inferencesh-cli-v1.18.24-darwin-amd64.tar.gz"
      sha256 "d828c5262a71bdc137da7d5da8f03b0ed03118a62abc2d002fe6154c6ea353a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.24/inferencesh-cli-v1.18.24-linux-arm64.tar.gz"
      sha256 "8595b7af459ccbf56486227cc87a3427dce037b3dd57b249dde3bdbe95464a4c"
    else
      url "https://dist.inference.sh/cli/v1.18.24/inferencesh-cli-v1.18.24-linux-amd64.tar.gz"
      sha256 "50c84eaef320e39f30c3d6b3a18631e023c2c702fd32745cbd0cde0d7bedb806"
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
