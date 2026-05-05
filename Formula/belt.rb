class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-vv1.9.7-darwin-arm64.tar.gz"
      sha256 "cfe92a8f9bdc94c83a5fadcc3365053d129747335091cc34c2fb8b782658c6b5"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-vv1.9.7-darwin-amd64.tar.gz"
      sha256 "a69909a3eca5b0f417f78a2b258fc8aad54f2b363844f723db4f384836e531b1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-vv1.9.7-linux-arm64.tar.gz"
      sha256 "ee0f3b60308de7308ab3f6a419aac2a6c75e8520b3ae0bc60031ce529639d8ea"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-vv1.9.7-linux-amd64.tar.gz"
      sha256 "6a154cfc18cf6bb09cc933dac3c3e35247a270bb39ed72fad88aed447bcc4991"
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
