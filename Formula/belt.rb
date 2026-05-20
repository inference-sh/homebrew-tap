class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.38"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.38-darwin-arm64.tar.gz"
      sha256 "84d2630be36581c5f00466466679a4918f818bc63e351e36dc17cfb9cd4927b7"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.38-darwin-amd64.tar.gz"
      sha256 "811fd825b26beb6c2bba87f6a37b681086c56fdc7a480a9390b0f58791b83e24"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.38-linux-arm64.tar.gz"
      sha256 "7d8aa7dbf8e655c6854e6899cec9c594d4b65d8b1e73ad114f60854623179281"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.38-linux-amd64.tar.gz"
      sha256 "83154f8c807e968aa5bda4e92120d2b3a5486a8b1745e60c1ccc6841bb57c008"
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
