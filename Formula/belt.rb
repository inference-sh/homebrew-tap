class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.9/inferencesh-cli-v1.28.9-darwin-arm64.tar.gz"
      sha256 "3d19911a4c0d7832c9b9f79b9cf060d37a68658efc8c60e46710c03025357502"
    else
      url "https://dist.inference.sh/cli/v1.28.9/inferencesh-cli-v1.28.9-darwin-amd64.tar.gz"
      sha256 "025b299b45ebc85ccd486ed86460cd8022a2d0d91837dd8f51d34c13251c2a65"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.9/inferencesh-cli-v1.28.9-linux-arm64.tar.gz"
      sha256 "2683c92e7de1ac09991fb54a1ee9a667b46cdb970ba9f51ea6bb3b8b01adc4c2"
    else
      url "https://dist.inference.sh/cli/v1.28.9/inferencesh-cli-v1.28.9-linux-amd64.tar.gz"
      sha256 "1343585e3e463a625497799e48233ec09e385460dadf4a2f26f840c2d6393eb9"
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
