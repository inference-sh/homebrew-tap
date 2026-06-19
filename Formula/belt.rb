class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.34"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.34-darwin-arm64.tar.gz"
      sha256 "6875f793dd3e097a29486b8c6de4ce32098c77c6602aa3aaa610306826300c7a"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.34-darwin-amd64.tar.gz"
      sha256 "51c7a8c82bc4adf0c6bc95e57112fa609450393a6fd728938c2e55fbf0978165"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.34-linux-arm64.tar.gz"
      sha256 "083e59f4deb45acef4ca44d64b6b48cc29d9b22d28b85d539fbf7900200d09a3"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.34-linux-amd64.tar.gz"
      sha256 "53bca7f4367796a44993958f91dc7e31d7d0df9d0a5cc7aa2b815f833b82c13c"
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
