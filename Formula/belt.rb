class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.35"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.35-darwin-arm64.tar.gz"
      sha256 "b42296aac25400d9b2e067206d92e8458e38b09750b3263c0c5bc2851317fe26"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.35-darwin-amd64.tar.gz"
      sha256 "c0203fedcccdc1a2e43df894dbfa436e5774f0d5278f07f107aabb26b8e385b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.35-linux-arm64.tar.gz"
      sha256 "c4b6b30f4e034d26b8c715d7917907f52c5c04dfeac10573e2ac88615fc19053"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.35-linux-amd64.tar.gz"
      sha256 "5ba827349b947b363e6403c26b43b301fbe77dfc954a7942b731b6e58582ffb1"
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
