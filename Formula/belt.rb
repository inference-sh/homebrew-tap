class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.25-darwin-arm64.tar.gz"
      sha256 "9432c2fefd4df61a01bdb5d440476fb838949e523ffee2478f9c7589419b0f25"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.25-darwin-amd64.tar.gz"
      sha256 "5ee1a322ac7b1aa8929169da4744c0ec7631a5f26609aa162276d7586aca6f5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.25-linux-arm64.tar.gz"
      sha256 "824faa1401a970c8bbc9c60a2faace4d5218e7f87b8c876eb713fe8a38b591c6"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.25-linux-amd64.tar.gz"
      sha256 "f9275af4c04451ae1f8a8bfd7aa77ac2d7d95648e4c5a28152e1d06513683440"
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
