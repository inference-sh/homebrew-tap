class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.2/inferencesh-cli-v1.19.2-darwin-arm64.tar.gz"
      sha256 "5caf61b2fb4e65f2ae40a2da6fd4628b2a1e8c9992aa80eb8aae145a45b2401a"
    else
      url "https://dist.inference.sh/cli/v1.19.2/inferencesh-cli-v1.19.2-darwin-amd64.tar.gz"
      sha256 "bdb4b4e33bc4d742f6a4fdfb9bb2d88d6dd5ea4333e1dbe7fd4980a427e31d7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.2/inferencesh-cli-v1.19.2-linux-arm64.tar.gz"
      sha256 "9753c2836be46fe74623542ff6251e98c095682255f296deee17d7c4a89ae922"
    else
      url "https://dist.inference.sh/cli/v1.19.2/inferencesh-cli-v1.19.2-linux-amd64.tar.gz"
      sha256 "f8f84efb89daef890aab6af0092165226ed201a93c1a3f9ff6de188f29376827"
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
