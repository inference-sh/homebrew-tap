class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.53"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.53/inferencesh-cli-v1.18.53-darwin-arm64.tar.gz"
      sha256 "9e8b2276c2584aa8dc8c3b7e64ce04ae47838ab4c0c6ab93f6944a322cc8dfa6"
    else
      url "https://dist.inference.sh/cli/v1.18.53/inferencesh-cli-v1.18.53-darwin-amd64.tar.gz"
      sha256 "180bb75805a0bae017e9094df630d40f1ee60d598f439ad1384b85338bc9faa8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.53/inferencesh-cli-v1.18.53-linux-arm64.tar.gz"
      sha256 "d586bc7b0756b7fd08963af3fc6eb30ce6a9458078ac2ff04f6e77079df3f177"
    else
      url "https://dist.inference.sh/cli/v1.18.53/inferencesh-cli-v1.18.53-linux-amd64.tar.gz"
      sha256 "03a8eb1d3a4571ecbeb3affad81e9a4be7b36ed56ca8422aed0024441ac0bb90"
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
