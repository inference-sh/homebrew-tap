class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.3/inferencesh-cli-v1.16.3-darwin-arm64.tar.gz"
      sha256 "4f552ea499f1aa832b4cf90e39d4bd75cf06062788261ed8f45562a2553ba7aa"
    else
      url "https://dist.inference.sh/cli/v1.16.3/inferencesh-cli-v1.16.3-darwin-amd64.tar.gz"
      sha256 "785a73f4c8283dcb9c66800176fd984cb59488e65ac67390bf9b99e565eef660"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.3/inferencesh-cli-v1.16.3-linux-arm64.tar.gz"
      sha256 "392d92caf8c843f441ca2f5a01ac8ea57502b859efd5a1c9514e0e43a5a3c0a0"
    else
      url "https://dist.inference.sh/cli/v1.16.3/inferencesh-cli-v1.16.3-linux-amd64.tar.gz"
      sha256 "c9ae1f2e221e79ccdf9c02a1e144e2ac0dd15479b0a1227cb1a5895e79f5d130"
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
