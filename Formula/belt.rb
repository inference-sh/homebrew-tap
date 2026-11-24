class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.11/inferencesh-cli-v1.29.11-darwin-arm64.tar.gz"
      sha256 "2d0f3094f4eb9ee081a3a493daaac8764b4b4b2b48da6aef15cba6fa61ce2aa8"
    else
      url "https://dist.inference.sh/cli/v1.29.11/inferencesh-cli-v1.29.11-darwin-amd64.tar.gz"
      sha256 "5eac911a850ea405eb72a71f0ee4e3aa05912ae6bd47a5149ca7e16a711dda0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.11/inferencesh-cli-v1.29.11-linux-arm64.tar.gz"
      sha256 "39aa3ad1febf26004f3ca8da3ab2f6b4f7355dd05f31d35763072e62f8d641b1"
    else
      url "https://dist.inference.sh/cli/v1.29.11/inferencesh-cli-v1.29.11-linux-amd64.tar.gz"
      sha256 "afb3aee363c1f496d28a494c244a2ad7ec772975703badb947f5e4f943db7469"
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
