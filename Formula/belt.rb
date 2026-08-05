class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.6/inferencesh-cli-v1.17.6-darwin-arm64.tar.gz"
      sha256 "8a3cc477b02637f2846ea314823d7c963a25b7849677ffde52b3cc7d7f267bf3"
    else
      url "https://dist.inference.sh/cli/v1.17.6/inferencesh-cli-v1.17.6-darwin-amd64.tar.gz"
      sha256 "40c4df0b58bd62e0ab7b81a46af5b8fd94e6e7565e60246bac14e95ef02b3420"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.6/inferencesh-cli-v1.17.6-linux-arm64.tar.gz"
      sha256 "6f9265857ef9089fb80cf0a11e50d2ff8f77850d9896e91991e2e5451276053f"
    else
      url "https://dist.inference.sh/cli/v1.17.6/inferencesh-cli-v1.17.6-linux-amd64.tar.gz"
      sha256 "cb03d7a59c7d4feac74d393b07a6c349ef642a106cc6edac85c1e9f5d4c0b29c"
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
