class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.6/inferencesh-cli-v1.16.6-darwin-arm64.tar.gz"
      sha256 "349bceafbcbe5cb79b6bfb12188bb9e3189fa8af7c9351c02ddd1bf2c11266f3"
    else
      url "https://dist.inference.sh/cli/v1.16.6/inferencesh-cli-v1.16.6-darwin-amd64.tar.gz"
      sha256 "515cc7270bba2bf74d11bedfa7b96fb2348e0b19533802ece4806d35022898c4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.6/inferencesh-cli-v1.16.6-linux-arm64.tar.gz"
      sha256 "c9fca74451018f0d0d6beb674f4cfd30646449a3d58fda564f3cb82bfbb3ed2f"
    else
      url "https://dist.inference.sh/cli/v1.16.6/inferencesh-cli-v1.16.6-linux-amd64.tar.gz"
      sha256 "d29f392ca7feb2e3bcb9ea2cdec86bec9602302848dc6e16166b06f732681f26"
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
