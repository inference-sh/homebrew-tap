class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.12/inferencesh-cli-v1.28.12-darwin-arm64.tar.gz"
      sha256 "7b65f74388fed4fd2b469c7523a353aa47b1ff951c4f9ba1617e1f6d7241e966"
    else
      url "https://dist.inference.sh/cli/v1.28.12/inferencesh-cli-v1.28.12-darwin-amd64.tar.gz"
      sha256 "62b8ca1b6ac94c0be58ec541b91bd8dc2bdb84a09f8914411966f8b9cad2698e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.12/inferencesh-cli-v1.28.12-linux-arm64.tar.gz"
      sha256 "209c27c1253a0131f188fad8cc66eec7d04518a83fe84d7aeb54969dfbe0e5b0"
    else
      url "https://dist.inference.sh/cli/v1.28.12/inferencesh-cli-v1.28.12-linux-amd64.tar.gz"
      sha256 "27ea1f6c6611984cf4aae022436e64e85bb1ab524645d37546d69bfaa4eb4462"
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
