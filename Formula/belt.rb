class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.2/inferencesh-cli-v1.28.2-darwin-arm64.tar.gz"
      sha256 "cb735259087487345ab9ad56dfdf9e87d70f30e457e9c49df95fcd71ee4e3b5a"
    else
      url "https://dist.inference.sh/cli/v1.28.2/inferencesh-cli-v1.28.2-darwin-amd64.tar.gz"
      sha256 "71539275461e0418c0647e076dec71ed001d90767e6db2485463ae0e5643d1a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.2/inferencesh-cli-v1.28.2-linux-arm64.tar.gz"
      sha256 "d799ddfa328580af6c3b8ce2d9e01f0016f19c74236174c9081bc17dba8a827b"
    else
      url "https://dist.inference.sh/cli/v1.28.2/inferencesh-cli-v1.28.2-linux-amd64.tar.gz"
      sha256 "72b25490cdd229ae4eeef8eba6ae2af2da14358d22e2b6a487ee6441977b9922"
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
