class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.12/inferencesh-cli-v1.26.12-darwin-arm64.tar.gz"
      sha256 "d70ec51e6c067d729ac5c2e5e2c6450c0e0f728df66ba61faae2297b17357f03"
    else
      url "https://dist.inference.sh/cli/v1.26.12/inferencesh-cli-v1.26.12-darwin-amd64.tar.gz"
      sha256 "d309fa6e7b6e55df181e7c5ebd7cd7d6d2c8e374f72d046b1214eb8ae160a60b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.12/inferencesh-cli-v1.26.12-linux-arm64.tar.gz"
      sha256 "abf958dd3e8674e350184562b84860427803c3bc340fe123e32df8dffa2b7aff"
    else
      url "https://dist.inference.sh/cli/v1.26.12/inferencesh-cli-v1.26.12-linux-amd64.tar.gz"
      sha256 "1b456022e65f9e103350e9060876c4200ea8fe187bdcf994191ded45d3bce628"
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
