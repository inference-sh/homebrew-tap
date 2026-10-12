class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.24.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.1/inferencesh-cli-v1.24.1-darwin-arm64.tar.gz"
      sha256 "2438b378c461958c38df3899c330f8deb89e40f07aaeaa5f13f820f5ae315c4e"
    else
      url "https://dist.inference.sh/cli/v1.24.1/inferencesh-cli-v1.24.1-darwin-amd64.tar.gz"
      sha256 "36657ae8c2e593580ab57f330d40e90b1fe27b0f04c2ca0944bcbedb32ffabbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.1/inferencesh-cli-v1.24.1-linux-arm64.tar.gz"
      sha256 "941a280c86ab312f8a9863d77d8ac52fbfef76650926ffa55ab45f19d5a17fa1"
    else
      url "https://dist.inference.sh/cli/v1.24.1/inferencesh-cli-v1.24.1-linux-amd64.tar.gz"
      sha256 "f9c8831c15ce1d12ba8d1e7ec5a4951de401199f794e9e9fcee979c6fc8a775c"
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
