class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.65"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.65/inferencesh-cli-v1.18.65-darwin-arm64.tar.gz"
      sha256 "f6cc58f3734e4e93ccdb5b5d0758a1bde2a6b8c288963d94cef6e2a58c419b4c"
    else
      url "https://dist.inference.sh/cli/v1.18.65/inferencesh-cli-v1.18.65-darwin-amd64.tar.gz"
      sha256 "86813a9c647b39e63052ecb397d07f3b22373d98c0c95d1b84472f0f68b8a178"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.65/inferencesh-cli-v1.18.65-linux-arm64.tar.gz"
      sha256 "3a786e31c963d0b95de905d4d8dee427b06671b3874d2954fae4c3120f688c6e"
    else
      url "https://dist.inference.sh/cli/v1.18.65/inferencesh-cli-v1.18.65-linux-amd64.tar.gz"
      sha256 "a3626fc97f2d6b0f8849d7acf959cd2716a646d5fbb14ad0b91d224ac9c77731"
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
