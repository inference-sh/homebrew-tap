class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.5/inferencesh-cli-v1.17.5-darwin-arm64.tar.gz"
      sha256 "81f6129c259b8d71481cd13df958defceddd5817ee8dc102818f4358a71a5a9d"
    else
      url "https://dist.inference.sh/cli/v1.17.5/inferencesh-cli-v1.17.5-darwin-amd64.tar.gz"
      sha256 "4935e7c6b47779f520b9b8457de3e7da23c162506c7f3205e5cae190ba07e5bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.5/inferencesh-cli-v1.17.5-linux-arm64.tar.gz"
      sha256 "70b801c62872e2f0f1f93f34494f98376749df66bd7fa29c85f110701657ba39"
    else
      url "https://dist.inference.sh/cli/v1.17.5/inferencesh-cli-v1.17.5-linux-amd64.tar.gz"
      sha256 "c3ce4ffcea605801693c89917fb853dd2b0d214786c1a1b5be971967cb45e216"
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
