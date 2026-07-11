class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.14.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.19/inferencesh-cli-v1.14.19-darwin-arm64.tar.gz"
      sha256 "3eda093107cb078faef92088b59c1b6e0c0ac8ddbfce04d20ee4ad295b6a9d4c"
    else
      url "https://dist.inference.sh/cli/v1.14.19/inferencesh-cli-v1.14.19-darwin-amd64.tar.gz"
      sha256 "3fd66dff0077edc690e718e95c69fe00cce996d69f7c1b6cfeaf9b3b5a22b537"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.19/inferencesh-cli-v1.14.19-linux-arm64.tar.gz"
      sha256 "68d949bc8349dc5935bdd6fa017698f0182d23004ad81968c2fc2be3c1e40004"
    else
      url "https://dist.inference.sh/cli/v1.14.19/inferencesh-cli-v1.14.19-linux-amd64.tar.gz"
      sha256 "405c8f01e0bd2b90552789b78b3ba88b4060a42a1522e563076ba9630c41c09a"
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
