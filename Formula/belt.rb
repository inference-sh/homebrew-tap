class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.4/inferencesh-cli-v1.25.4-darwin-arm64.tar.gz"
      sha256 "aee7330891b2d68e2778a1fe99872e77c90dcfc9861d0f5cca299391732fecd8"
    else
      url "https://dist.inference.sh/cli/v1.25.4/inferencesh-cli-v1.25.4-darwin-amd64.tar.gz"
      sha256 "ed8ce35795f0413d37c819c8c07d36bb86bf9cf30eda398cdd0dee866715e041"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.4/inferencesh-cli-v1.25.4-linux-arm64.tar.gz"
      sha256 "57fc3950eb196b8fdde9a9f46edd5ca94aceb5e7b52463a57d29c09257af014e"
    else
      url "https://dist.inference.sh/cli/v1.25.4/inferencesh-cli-v1.25.4-linux-amd64.tar.gz"
      sha256 "2dea8f2bcd33c8268da878b61be8c1c67f776343a34661e1e502e6fb75e0419a"
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
