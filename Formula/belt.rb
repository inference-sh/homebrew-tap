class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.3/inferencesh-cli-v1.19.3-darwin-arm64.tar.gz"
      sha256 "d1ae3818386ccdce55be45bf88f37af35ef5ad563aafa1439c461d46326d9b10"
    else
      url "https://dist.inference.sh/cli/v1.19.3/inferencesh-cli-v1.19.3-darwin-amd64.tar.gz"
      sha256 "780b36c9bee96763fb882d5b4487190bd1d99c7cfefce7bd36d18d9d1d07919c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.3/inferencesh-cli-v1.19.3-linux-arm64.tar.gz"
      sha256 "7d0ad7463a6e40c52fd60aa2b3d368d4e4c12a7f1205959117ee9f28e0922cc1"
    else
      url "https://dist.inference.sh/cli/v1.19.3/inferencesh-cli-v1.19.3-linux-amd64.tar.gz"
      sha256 "a4602acec9bccfe453e45b241e9e9924f65a95b62427bdcc386a504352eae722"
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
