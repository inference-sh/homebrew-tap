class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.21/inferencesh-cli-v1.28.21-darwin-arm64.tar.gz"
      sha256 "5ea392969e3dedadeae9c5befd1d0ac4bcd541e887b0a25348d9f48c34688e9b"
    else
      url "https://dist.inference.sh/cli/v1.28.21/inferencesh-cli-v1.28.21-darwin-amd64.tar.gz"
      sha256 "87f172a83c11e7991815911e3a34da260d682e63bfb2e9e0395203d7f934efa6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.21/inferencesh-cli-v1.28.21-linux-arm64.tar.gz"
      sha256 "3edecf0f42a0029b3edafd9676b970cf5d71c5a27d58611d45a9df2ea4e4f500"
    else
      url "https://dist.inference.sh/cli/v1.28.21/inferencesh-cli-v1.28.21-linux-amd64.tar.gz"
      sha256 "ab433a68bc6b7033fdbaeb7812a4ea91b8be2d2b4d3741419aa26c1178c480fd"
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
