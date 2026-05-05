class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.4-1-g95b369f"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-vv1.9.4-1-g95b369f-darwin-arm64.tar.gz"
      sha256 "209749e10405045224a181130943441d79c41ab9dfb6bd4d7d4023435305f6bc"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-vv1.9.4-1-g95b369f-darwin-amd64.tar.gz"
      sha256 "9e204aa92eb70ad88d69cb8a77ed940f4d1a1d53e1e583dd8444a8f6594818d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-vv1.9.4-1-g95b369f-linux-arm64.tar.gz"
      sha256 "6e3e628aa50bda198d099689b27726eedf3aeceabc844ca844f73cc61ee93de6"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-vv1.9.4-1-g95b369f-linux-amd64.tar.gz"
      sha256 "9788e2a3c57a66709aee533fe9e5bb7daf4f4801a71eb4167ea72015961a8d92"
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
