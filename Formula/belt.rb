class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.3/inferencesh-cli-v1.26.3-darwin-arm64.tar.gz"
      sha256 "93368f962692ddee0b8c53343c26e23c9cada9cd6cc9f42871e75c7e55fb314c"
    else
      url "https://dist.inference.sh/cli/v1.26.3/inferencesh-cli-v1.26.3-darwin-amd64.tar.gz"
      sha256 "318bb2ba505ea65305d115f841615cee5135cf433c4594e3cdc0670bf10869a2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.3/inferencesh-cli-v1.26.3-linux-arm64.tar.gz"
      sha256 "b31668bd1ad75ceb708debf2778805ffd61bcb8e4fda6001aeaeb7aa1fc3414a"
    else
      url "https://dist.inference.sh/cli/v1.26.3/inferencesh-cli-v1.26.3-linux-amd64.tar.gz"
      sha256 "2ab58fe08dcf9568d3dc98210725a866329199e1779cfc39eed9cde5338f7f5c"
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
