class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.38"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.38/inferencesh-cli-v1.18.38-darwin-arm64.tar.gz"
      sha256 "b3deefe08d868d30c631d50e29741bafc5809ba6b216a7edfca5605e9b4873db"
    else
      url "https://dist.inference.sh/cli/v1.18.38/inferencesh-cli-v1.18.38-darwin-amd64.tar.gz"
      sha256 "9146007ba87a68be1960e908addc27c60e581940b96f5c62f1bfad5fe177e615"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.38/inferencesh-cli-v1.18.38-linux-arm64.tar.gz"
      sha256 "7cd5431793025a91f24a7f266efc9fac78b2ce581c2c0af9ee80e5ccbd22550c"
    else
      url "https://dist.inference.sh/cli/v1.18.38/inferencesh-cli-v1.18.38-linux-amd64.tar.gz"
      sha256 "4e2fec99e805107044fb17e961e51a6957c002a1925bad54300a294698b5cb17"
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
