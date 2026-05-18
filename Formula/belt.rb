class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.22-darwin-arm64.tar.gz"
      sha256 "2dc4e5f8cfa0095fe5dcafc61708c8eac0e22502333777c6f25cba41338020ad"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.22-darwin-amd64.tar.gz"
      sha256 "3ceb1975fdc2c3bdc87866f16c64adc156d518cb05e8b36e6bcaa27c371ebec0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.22-linux-arm64.tar.gz"
      sha256 "3ef300c6488df255f815e287b12d89d76552f601c91d20ea9eb51344a64ca096"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.22-linux-amd64.tar.gz"
      sha256 "eb9718cf5a7a3a2ea3c209af5ef776edb9b2b5b7bf88c01d945e328f49d1cf36"
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
