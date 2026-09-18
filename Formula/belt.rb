class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.40"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.40/inferencesh-cli-v1.18.40-darwin-arm64.tar.gz"
      sha256 "f4fc6eb536933b3842526b7f318722e2cf57ad77e6ac0c45d1b0c2d22977db2b"
    else
      url "https://dist.inference.sh/cli/v1.18.40/inferencesh-cli-v1.18.40-darwin-amd64.tar.gz"
      sha256 "ecf67f1ac7362dcc80c15664035c6d4cbef0db230a754fe8acb38593dcc12ca8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.40/inferencesh-cli-v1.18.40-linux-arm64.tar.gz"
      sha256 "2fc92e9a025291aab672453918efad2af88b6f29f27d91a178f03c2d968006f6"
    else
      url "https://dist.inference.sh/cli/v1.18.40/inferencesh-cli-v1.18.40-linux-amd64.tar.gz"
      sha256 "8941bf6bcdb667b8fe325673fbb4ce436794724fe606dc50314cc1bc0c95f415"
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
