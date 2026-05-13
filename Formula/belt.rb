class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.10-darwin-arm64.tar.gz"
      sha256 "3fda964367aaeb6ee9a59c4262108b67eac0bb62ffa753d6491b3767edb90feb"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.10-darwin-amd64.tar.gz"
      sha256 "320282dacf9508d50a36cf630b029806f0f1a773fb42be5a75d3607c1d275f3b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.10-linux-arm64.tar.gz"
      sha256 "0cfceb9d3daa8a8fe521592e1620ab1a0fe0ad088a16dc5d0bb143d62498502b"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.10-linux-amd64.tar.gz"
      sha256 "d160311e581ad77ef14f28a7c67614f44e8a685c5cf594e1ffe01b8029e7fe29"
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
