class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.35"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.35/inferencesh-cli-v1.18.35-darwin-arm64.tar.gz"
      sha256 "88c9dfee7dcfea2b3eeddd14e71c6611221dceee2701328c3b2af0c62932218b"
    else
      url "https://dist.inference.sh/cli/v1.18.35/inferencesh-cli-v1.18.35-darwin-amd64.tar.gz"
      sha256 "8ee6700d66edb6602aa7fe072b4e8e4b41873a961e634af0adb3c0e08f27c114"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.35/inferencesh-cli-v1.18.35-linux-arm64.tar.gz"
      sha256 "1f7c9164507df400a37dafd1e3a6c9398dbce20b0126948f925d042e1db07cae"
    else
      url "https://dist.inference.sh/cli/v1.18.35/inferencesh-cli-v1.18.35-linux-amd64.tar.gz"
      sha256 "a7cdf533cd8a4613482778eee0d48bb92faf16734b04556167ca3d027e16e6ad"
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
