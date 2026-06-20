class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.35"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.35-darwin-arm64.tar.gz"
      sha256 "2d5f964ccc5eea83c82487226796cf11055c75c05bf77b9b172089b31f97c735"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.35-darwin-amd64.tar.gz"
      sha256 "b2a6f8425c15733005011880d1ebf3117be1e50b2d33a1f6b22ab2039a5e49e9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.35-linux-arm64.tar.gz"
      sha256 "21b5b6edcd6845aafadaa68185a8d54e03017a79330a87fd4beb5a1d7e788b64"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.35-linux-amd64.tar.gz"
      sha256 "b03d1c2c03078f680aa2803643145f800982f1a46bd4b9fda74dca97c2184e9a"
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
