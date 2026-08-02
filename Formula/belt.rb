class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.17/inferencesh-cli-v1.16.17-darwin-arm64.tar.gz"
      sha256 "a9c75339b5c03e04ed7772a4e3f058a11da54cdb989ff9ee8837a1b9f8699360"
    else
      url "https://dist.inference.sh/cli/v1.16.17/inferencesh-cli-v1.16.17-darwin-amd64.tar.gz"
      sha256 "081c25c1be6e3392f49e29d899d3dd24bfb843aa6c0803a821ae14a816890eff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.17/inferencesh-cli-v1.16.17-linux-arm64.tar.gz"
      sha256 "2059d571282324eebbf53917d9eb65fdc4d1a02ba908459119af741bd84f80bb"
    else
      url "https://dist.inference.sh/cli/v1.16.17/inferencesh-cli-v1.16.17-linux-amd64.tar.gz"
      sha256 "5b2bdc47c4ecc14d61059206a27139db4419ed7a08e64217255e2e2a52623bd6"
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
