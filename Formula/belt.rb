class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.0-darwin-arm64.tar.gz"
      sha256 "68e9f9034c2946824a0c5d94edb0824d3a5e55735886aab2441418f633841344"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.0-darwin-amd64.tar.gz"
      sha256 "4e11498371a68eb06b447467e93da20ba17b44919e7b72a7de7138063d3bf61b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.0-linux-arm64.tar.gz"
      sha256 "cff72466b204b82efffbb9092c187cb9bb336c293d4b796035b80fdfcf394155"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.0-linux-amd64.tar.gz"
      sha256 "a122dbade69992ead9aa818ef9f3f71077de3c815e91f7af4066c758d9cb34b9"
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
