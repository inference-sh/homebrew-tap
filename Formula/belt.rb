class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.11-darwin-arm64.tar.gz"
      sha256 "73db7e0ee4547a5943f74f281c675d33be552a0f013256cdde12cb997dc3a416"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.11-darwin-amd64.tar.gz"
      sha256 "153f0a1d3ab43be4135dcc8eff83a4fe0d8b06de8b1eae064cd8273322cc7e9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.11-linux-arm64.tar.gz"
      sha256 "8c4f40a016fb889993b3286322ac8bf4218a2a3dff3a8f0c95994092252d98dc"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.11-linux-amd64.tar.gz"
      sha256 "b839229c4fd8cab43f37ccd4895f55b755bfb44ab1ac157260554bf6e1c41fad"
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
