class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.22/inferencesh-cli-v1.15.22-darwin-arm64.tar.gz"
      sha256 "11934adc5792b163996a1bc3be27697ef8d90769913576d4a7419b4995db6dbc"
    else
      url "https://dist.inference.sh/cli/v1.15.22/inferencesh-cli-v1.15.22-darwin-amd64.tar.gz"
      sha256 "c9b65740cb6b4ecedb832c5a8289060b38cd9c8f0c0d0cd5c388faf328a9dc62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.22/inferencesh-cli-v1.15.22-linux-arm64.tar.gz"
      sha256 "c97338c43b345708f0333d8153de9081bef0521140a04f7f9bc0a1aa0f56ea30"
    else
      url "https://dist.inference.sh/cli/v1.15.22/inferencesh-cli-v1.15.22-linux-amd64.tar.gz"
      sha256 "44fd47542f48f605b5d4790e51c65f97e0e26d812d8ae24f577bad8172c859e8"
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
