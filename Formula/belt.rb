class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.29/inferencesh-cli-v1.15.29-darwin-arm64.tar.gz"
      sha256 "33e15fde7a51f55bdbcb98afbe8d526abb7cf7eb5f7e34c6a3ab189cf422b926"
    else
      url "https://dist.inference.sh/cli/v1.15.29/inferencesh-cli-v1.15.29-darwin-amd64.tar.gz"
      sha256 "5ff1d2731aa04316f832869e94a7e4c15ecbd60f739d368e5aac2cc5cf6abd78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.29/inferencesh-cli-v1.15.29-linux-arm64.tar.gz"
      sha256 "c63d32f822c3d5d6b027c1bc29de4fd111a748cc0c350d737c8b6924fb9ff6fd"
    else
      url "https://dist.inference.sh/cli/v1.15.29/inferencesh-cli-v1.15.29-linux-amd64.tar.gz"
      sha256 "3304e4e7258613c0bb340d4357e88f04a3c7b4061d7805beff76b45163175108"
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
