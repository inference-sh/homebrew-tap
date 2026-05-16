class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.4-darwin-arm64.tar.gz"
      sha256 "c9b88f8c3284ddb77fb358b83286c4a0538221f17a1bd682326d1fa1f3bea381"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.4-darwin-amd64.tar.gz"
      sha256 "b43a74c79d2e971157ed925a56c201a406fb315e187c129962efc5e8f846eb1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.4-linux-arm64.tar.gz"
      sha256 "43abee7d3ac1cb02b8623f92e95a1914c13b02297c49fcfa0185f7d72cd4b50b"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.4-linux-amd64.tar.gz"
      sha256 "7ff126e993a1d86b1fe4de0d2274095525cccf1694b49bc6e8e337905c2bbe5e"
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
