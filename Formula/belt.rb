class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.16/inferencesh-cli-v1.16.16-darwin-arm64.tar.gz"
      sha256 "647645654a9cd414c7270ffdc2f47267a6d3dee8ba4a76bc938edeb5c65c68d6"
    else
      url "https://dist.inference.sh/cli/v1.16.16/inferencesh-cli-v1.16.16-darwin-amd64.tar.gz"
      sha256 "e634a94244ac451db17e88cba237903ccc8d3e5ded0adc8a0481aeb415f43392"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.16/inferencesh-cli-v1.16.16-linux-arm64.tar.gz"
      sha256 "d07bcd21cfdddcd67b4ef42ec51d73355cf97d61eaec0adc2754bf58dcaabf95"
    else
      url "https://dist.inference.sh/cli/v1.16.16/inferencesh-cli-v1.16.16-linux-amd64.tar.gz"
      sha256 "569b41d4199c70e45cf7f20220a15e04b4fe6ecf9c7aea25c536dd3efe3ae895"
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
