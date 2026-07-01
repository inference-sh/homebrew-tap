class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.14.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.6-darwin-arm64.tar.gz"
      sha256 "f362d0bb08617f13e02442e22dfd3ca10e52d2d530abf9640869e928f7fd02bd"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.6-darwin-amd64.tar.gz"
      sha256 "228d2e093006636ee5685841fe96d309a2cf62826885fd5ab72d630f91c61dcb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.6-linux-arm64.tar.gz"
      sha256 "7d1edb5868fa2513ed00ea4c4ec075e02adcc5fa07a5fcde8071c623a24b4d4c"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.6-linux-amd64.tar.gz"
      sha256 "22bde9caa8b3318c5939a32cb5a4687c40563551312c78aceb9c34b70f177c2f"
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
