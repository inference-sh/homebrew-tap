class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.20-darwin-arm64.tar.gz"
      sha256 "c860405ed96aa3cf8395db8ec2bec6fd5aa4e89407ec333deba74bf658b45df7"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.20-darwin-amd64.tar.gz"
      sha256 "41dc8cabf6da41b35b07ff107a91ef74a164c1224fd581a9f0b36f551447c24a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.20-linux-arm64.tar.gz"
      sha256 "e9fffd4fcfaeca7cd87b13a4558b30c8ec3ea502b223568c9119837c78fe45a5"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.20-linux-amd64.tar.gz"
      sha256 "115d9e8f4571fafe7a24016653f35f1e5d090977f1c378a5a07549ba5607bf4f"
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
