class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.16/inferencesh-cli-v1.17.16-darwin-arm64.tar.gz"
      sha256 "f1a84c9a75c833ca9e59558c3ce8b65d81bcf95bb5ef7774677402e3149b49e7"
    else
      url "https://dist.inference.sh/cli/v1.17.16/inferencesh-cli-v1.17.16-darwin-amd64.tar.gz"
      sha256 "d44277f6edfbcfe9e8ee8cef9a095b382a6ed1dd80fd9999e3c2c17a68e1abd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.16/inferencesh-cli-v1.17.16-linux-arm64.tar.gz"
      sha256 "395b5047e15f447758e8c2789e1a1e14b638db6440154ebc9851531647c585d0"
    else
      url "https://dist.inference.sh/cli/v1.17.16/inferencesh-cli-v1.17.16-linux-amd64.tar.gz"
      sha256 "4620efc46d5d8b9348adc3d03856fd13c1b479878eca4ce9da31be53dcbf85a6"
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
