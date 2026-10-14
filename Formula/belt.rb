class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.1/inferencesh-cli-v1.25.1-darwin-arm64.tar.gz"
      sha256 "4757ca96c07b2417e6d79d26684429a50690234bbcd2a879b034e1cee9e76193"
    else
      url "https://dist.inference.sh/cli/v1.25.1/inferencesh-cli-v1.25.1-darwin-amd64.tar.gz"
      sha256 "c8901c011abb89e2f50a2c53a6eb90d0b861e1fe2f425ba019835bb140be9491"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.1/inferencesh-cli-v1.25.1-linux-arm64.tar.gz"
      sha256 "d65ac014b6bb724ba5d714ef4c525b8b6d14fcbeb43c94c73946311ab3bef7cd"
    else
      url "https://dist.inference.sh/cli/v1.25.1/inferencesh-cli-v1.25.1-linux-amd64.tar.gz"
      sha256 "67df5f3b0c6e2f701c6173caf9f9da650dcff2beb701a25f1fe6ed94ede5bc19"
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
