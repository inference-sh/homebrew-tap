class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.4/inferencesh-cli-v1.29.4-darwin-arm64.tar.gz"
      sha256 "3c4057621ab4bb57243b50b93874525ca680d21e2b42d5f19a2fa4f61ec38a45"
    else
      url "https://dist.inference.sh/cli/v1.29.4/inferencesh-cli-v1.29.4-darwin-amd64.tar.gz"
      sha256 "9d4b78e9f8909352d5206028afb7f12bb19a30833dd071a1d63d57cfc1fa6533"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.4/inferencesh-cli-v1.29.4-linux-arm64.tar.gz"
      sha256 "c80030a584f8c8876b5f52011eec396b6154dd830e7759aeaaa9df62b2a7c00f"
    else
      url "https://dist.inference.sh/cli/v1.29.4/inferencesh-cli-v1.29.4-linux-amd64.tar.gz"
      sha256 "c403804b06b27141e77036a8b0d0112ea693a81c081eb233ee319ad0bb3964f4"
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
