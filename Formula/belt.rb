class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.21-darwin-arm64.tar.gz"
      sha256 "cbeafced0352cf30c799ecf6e5ce1aa3b48f3bc392fee265763d36e0b4902070"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.21-darwin-amd64.tar.gz"
      sha256 "c2897fa5f4573945506bbc39b46faacfdde18e36219308334a6f8afbbbb5d7ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.21-linux-arm64.tar.gz"
      sha256 "78f430b1e606d9ce92091cae66e5ad7c7544a80a43313aa5c18d7745f504d98e"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.21-linux-amd64.tar.gz"
      sha256 "f2587bb1dcd856b3368ce02a1ecbd6ed7241239fc61121c3d7430348fef0ce72"
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
