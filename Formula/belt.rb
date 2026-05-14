class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.16-darwin-arm64.tar.gz"
      sha256 "b23db9b9ac83fa2acf30820092c79639bc86df9a46d35ed1f88de6aed740e5e9"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.16-darwin-amd64.tar.gz"
      sha256 "31cbbc2db9d016f256685dcd1755ef035fac5d6c13c10b5bacfaee2a5babb6ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.16-linux-arm64.tar.gz"
      sha256 "55e552e5d956aea951fad034cd37b25a0213f976298b5d90b1550485be7df3f7"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.16-linux-amd64.tar.gz"
      sha256 "369c02c6c8c3a9651abd5b538ed8ca9bd16d9e20fcda936654a461dba219c2eb"
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
