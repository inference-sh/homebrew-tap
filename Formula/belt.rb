class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.0/inferencesh-cli-v1.28.0-darwin-arm64.tar.gz"
      sha256 "9e690021ce62597bb910c99596675f413480b2446368b06b1f69917c877d2384"
    else
      url "https://dist.inference.sh/cli/v1.28.0/inferencesh-cli-v1.28.0-darwin-amd64.tar.gz"
      sha256 "ab079c16bf433493be552364f0e0ffb2d5dc77da3860e89f5b746ddcb3586473"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.0/inferencesh-cli-v1.28.0-linux-arm64.tar.gz"
      sha256 "244e0c0b3c9d45ef1441a03c0c8e0d0248cc4ce203f0fe5b6f38d64ad4304ff5"
    else
      url "https://dist.inference.sh/cli/v1.28.0/inferencesh-cli-v1.28.0-linux-amd64.tar.gz"
      sha256 "87de1d340cfad53a21b41c739f015a267d390ed0483a683e8a3a6db0ea499b05"
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
