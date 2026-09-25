class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.66"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.66/inferencesh-cli-v1.18.66-darwin-arm64.tar.gz"
      sha256 "b4c5fc822a9afac00acf9691a3c9f94a22981d081b3f05460a27572aca6dc894"
    else
      url "https://dist.inference.sh/cli/v1.18.66/inferencesh-cli-v1.18.66-darwin-amd64.tar.gz"
      sha256 "478feca06a4544fe9e41b9da1f473062653b1b3981343215c8ea29922117d9f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.66/inferencesh-cli-v1.18.66-linux-arm64.tar.gz"
      sha256 "7838e91ce7bc5347447947194089ad347a23c143a724e9889742dacc9582f51c"
    else
      url "https://dist.inference.sh/cli/v1.18.66/inferencesh-cli-v1.18.66-linux-amd64.tar.gz"
      sha256 "5a443aa0f9863b207ab892cf8a87281c312bf74188e4f085182d0989645ec86f"
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
