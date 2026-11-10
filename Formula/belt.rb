class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.33/inferencesh-cli-v1.28.33-darwin-arm64.tar.gz"
      sha256 "3c7ca93325b8b6af6a4e8aa19f9f68e46098cf387a02116921daf8b9a89c5be7"
    else
      url "https://dist.inference.sh/cli/v1.28.33/inferencesh-cli-v1.28.33-darwin-amd64.tar.gz"
      sha256 "061e909a494a5099fc1996f2a60418f1ce6e6a8c9b511a4f0c1ce8ad2f26ec03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.33/inferencesh-cli-v1.28.33-linux-arm64.tar.gz"
      sha256 "97b68df1585ceb01df5a14fc7e2cdeca95d86f7b035e41470ca20920b7b3535c"
    else
      url "https://dist.inference.sh/cli/v1.28.33/inferencesh-cli-v1.28.33-linux-amd64.tar.gz"
      sha256 "14f29be608260feb6d85b8f6f541f65c723e2d9fcc9dc98c5fb62a8fddb7d889"
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
