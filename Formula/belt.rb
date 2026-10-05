class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.12/inferencesh-cli-v1.19.12-darwin-arm64.tar.gz"
      sha256 "a89236df9f089df2fc0aac0a3bd4d1f5233e8e62a4c309b3b7dbacda2919fd0d"
    else
      url "https://dist.inference.sh/cli/v1.19.12/inferencesh-cli-v1.19.12-darwin-amd64.tar.gz"
      sha256 "40631d8a1e0d1f2c025390a608dbd97660149e18b95a91e76ab39a06cf75e565"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.12/inferencesh-cli-v1.19.12-linux-arm64.tar.gz"
      sha256 "61e6952bfef5fa903d9cf84ed3af95174f8dd2504e802a8a022b1a4349b8c2cc"
    else
      url "https://dist.inference.sh/cli/v1.19.12/inferencesh-cli-v1.19.12-linux-amd64.tar.gz"
      sha256 "7ce483a5e16525d5b7f2c29e6e14c2477c286af846384f8c9f168e33bd3e8647"
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
