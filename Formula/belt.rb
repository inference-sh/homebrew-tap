class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.28-darwin-arm64.tar.gz"
      sha256 "41376e6869356b4496aa10a974cf8234653a4f15dfb9c3edd8383567eff7bdfb"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.28-darwin-amd64.tar.gz"
      sha256 "42d3ea441b66a8f7889ead1c0415524ea5df8cfb0a63d63c9552ac35238682c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.28-linux-arm64.tar.gz"
      sha256 "52a772047a2cdcb5c0f35cd37aa985a366157e8b49fcfd81f5ecae234016eb52"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.28-linux-amd64.tar.gz"
      sha256 "9973f3759a4ba6c4e906b7f3efbcc7a18bd5e080ba71b53deb5493d137432a4a"
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
