class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.4/inferencesh-cli-v1.26.4-darwin-arm64.tar.gz"
      sha256 "52b6ad10f30f309353bc37ffd2af27433d3f8fc55cf25b78dbbe3eaf74273206"
    else
      url "https://dist.inference.sh/cli/v1.26.4/inferencesh-cli-v1.26.4-darwin-amd64.tar.gz"
      sha256 "5aa3c69be1df630981c73866a74af5c9725d3b75d5545de3039627c100960128"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.4/inferencesh-cli-v1.26.4-linux-arm64.tar.gz"
      sha256 "b739492be9f89c36bc0fa002d5eccf752906da669c0a49490c742b5371d1b818"
    else
      url "https://dist.inference.sh/cli/v1.26.4/inferencesh-cli-v1.26.4-linux-amd64.tar.gz"
      sha256 "a2f2a590ddb2ca5bea67449a5d9b89963f91ecea4f18cf39fe51ec0828a3c60d"
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
