class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.40"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.40/inferencesh-cli-v1.28.40-darwin-arm64.tar.gz"
      sha256 "25d3da2f83412b884ca6b8796d950371410b285375c5fe68480888a7baa5ee3f"
    else
      url "https://dist.inference.sh/cli/v1.28.40/inferencesh-cli-v1.28.40-darwin-amd64.tar.gz"
      sha256 "f88dde1d8f14e85322b55574228de478646484cb4dc8ec604da833c0b7009115"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.40/inferencesh-cli-v1.28.40-linux-arm64.tar.gz"
      sha256 "6623e5f3f8c9a3e27edf178c1ac3551bf6947ebc530b5e513fc02f7b5a420fff"
    else
      url "https://dist.inference.sh/cli/v1.28.40/inferencesh-cli-v1.28.40-linux-amd64.tar.gz"
      sha256 "1c8785488aa94bda6929219df2be81c83bac501e41d2be864e0cb23b282b1556"
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
