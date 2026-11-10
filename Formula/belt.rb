class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.29/inferencesh-cli-v1.28.29-darwin-arm64.tar.gz"
      sha256 "06676a7a337887d198cafdbf6f744ce9d2a169cb7d36e7a7a7bc1746b0618be1"
    else
      url "https://dist.inference.sh/cli/v1.28.29/inferencesh-cli-v1.28.29-darwin-amd64.tar.gz"
      sha256 "b0cbb3b3d9bf22d2d22057622e62b11607a0e754d32675021f4f79c894955f6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.29/inferencesh-cli-v1.28.29-linux-arm64.tar.gz"
      sha256 "99192e6bef28696c6aa35ae7144c4eb142182a9b38c6cb10581b52aef87b0fda"
    else
      url "https://dist.inference.sh/cli/v1.28.29/inferencesh-cli-v1.28.29-linux-amd64.tar.gz"
      sha256 "82b0beabf0a2b87523617d2cd78cdc713778d424b904d856fb6881301b9238b3"
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
