class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.14-darwin-arm64.tar.gz"
      sha256 "0c8394f7a0ce85bcc31db4fbe74f13598f6b63e362f40e7a41da7c3caba80635"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.14-darwin-amd64.tar.gz"
      sha256 "fd57b10a3eeea807a95f3e8c44f47058d196e523cccd92d8b2704e1997d4350b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.14-linux-arm64.tar.gz"
      sha256 "d2f45adbab6deba99c6b14a4d3ad264df9f0efec3c833ca86d5dd9d298fd641c"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.14-linux-amd64.tar.gz"
      sha256 "8e67a17749a38ae2f73daf92d37a969c879ff8f34502a5ef55fc2ad18a93db1f"
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
