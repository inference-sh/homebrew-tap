class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.3-19-gb1a3452"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.3-19-gb1a3452/inferencesh-cli-v1.15.3-19-gb1a3452-darwin-arm64.tar.gz"
      sha256 "22cf1008d446e2a64816a0e2f38f3d56e5424306714f7dc00b67f266dc0c9eba"
    else
      url "https://dist.inference.sh/cli/v1.15.3-19-gb1a3452/inferencesh-cli-v1.15.3-19-gb1a3452-darwin-amd64.tar.gz"
      sha256 "2efbb8d0bb4304650a687b29b2364fc9109a6675be7b297b431935acb25225ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.3-19-gb1a3452/inferencesh-cli-v1.15.3-19-gb1a3452-linux-arm64.tar.gz"
      sha256 "d2bb4bc3059c19f4802083cf9f0d67c804848653266054866a6b88ea7ab77512"
    else
      url "https://dist.inference.sh/cli/v1.15.3-19-gb1a3452/inferencesh-cli-v1.15.3-19-gb1a3452-linux-amd64.tar.gz"
      sha256 "54ea9d0e66872766e9fb0c1941ec073842f2fd873d23efcca0a2428343c6e357"
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
