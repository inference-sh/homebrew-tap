class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.43"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.43/inferencesh-cli-v1.18.43-darwin-arm64.tar.gz"
      sha256 "233a7f04ff7a65b5f03d1c1d048dc7d3e6b174ce80bbad69708903943500df87"
    else
      url "https://dist.inference.sh/cli/v1.18.43/inferencesh-cli-v1.18.43-darwin-amd64.tar.gz"
      sha256 "a87da060e50f684537631bb8e049678f0365ba38803a5a2e6417673e5e3de549"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.43/inferencesh-cli-v1.18.43-linux-arm64.tar.gz"
      sha256 "708df7a54a009aa21e9a06e53196250f93bae6082a63e66c9faffc297caa06a2"
    else
      url "https://dist.inference.sh/cli/v1.18.43/inferencesh-cli-v1.18.43-linux-amd64.tar.gz"
      sha256 "746ce37583785e0780bc9c5c81012302d517d7fb4977351b12958c1e702a7790"
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
