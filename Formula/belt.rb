class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.14.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.11/inferencesh-cli-v1.14.11-darwin-arm64.tar.gz"
      sha256 "8c9e7ddd41425ef5682198a07aabb16379c6834162eb873b09c8c5ce20f5b672"
    else
      url "https://dist.inference.sh/cli/v1.14.11/inferencesh-cli-v1.14.11-darwin-amd64.tar.gz"
      sha256 "33f68a04fefc9bf2ec1d12c4b70b5007bd1cd0bcb15ccda0da2c3b4192ecdcfd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.11/inferencesh-cli-v1.14.11-linux-arm64.tar.gz"
      sha256 "cae4d6b4a086d8a4fee99499cc6de8c9529ab5922297383c3f93b5a36e5165c6"
    else
      url "https://dist.inference.sh/cli/v1.14.11/inferencesh-cli-v1.14.11-linux-amd64.tar.gz"
      sha256 "e9cbf7e66638f1bdff6eeeeccee90cea8a26a50c5d62526526adb3928192c3ee"
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
