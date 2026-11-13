class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.42"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.42/inferencesh-cli-v1.28.42-darwin-arm64.tar.gz"
      sha256 "94e4b63c4433f7b7e59264423b7110aa5acf94c25e360bdfb3833c3a7b2f4eab"
    else
      url "https://dist.inference.sh/cli/v1.28.42/inferencesh-cli-v1.28.42-darwin-amd64.tar.gz"
      sha256 "c1ab23d8b3d036685b6f81a832707463452135e40ac55ecf3105f7bd08c3266b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.42/inferencesh-cli-v1.28.42-linux-arm64.tar.gz"
      sha256 "a4914259af537bdad3769cafc1ef051a73c752005953b804ae2c251597672bfb"
    else
      url "https://dist.inference.sh/cli/v1.28.42/inferencesh-cli-v1.28.42-linux-amd64.tar.gz"
      sha256 "5c8199c8edc2e1cc540877c232f2b215acb087b58f5da67d9c792577e8fcd2d4"
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
