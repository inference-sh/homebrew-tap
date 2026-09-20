class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.44"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.44/inferencesh-cli-v1.18.44-darwin-arm64.tar.gz"
      sha256 "90eb172e94e8a01fc2d5c17d3443a50e627019bb5dc01fff2235c759162f8362"
    else
      url "https://dist.inference.sh/cli/v1.18.44/inferencesh-cli-v1.18.44-darwin-amd64.tar.gz"
      sha256 "16c05cc5461228abdbb94efa29ba56a2a8c3a17b046d1dcd87ff78d003f82b27"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.44/inferencesh-cli-v1.18.44-linux-arm64.tar.gz"
      sha256 "c3eb3c7f37b089237bdf9c26eda106de6a5455a5f8a21a44835c870ada581cb2"
    else
      url "https://dist.inference.sh/cli/v1.18.44/inferencesh-cli-v1.18.44-linux-amd64.tar.gz"
      sha256 "022046c82bd43ca4071fe1f098d73b8924c088d94fbfb0094554ccddb8bc66d4"
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
