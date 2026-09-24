class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.58"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.58/inferencesh-cli-v1.18.58-darwin-arm64.tar.gz"
      sha256 "2dd43493dec1d2747dd64d94908c411db36ae878a3d56c2389ad1437ab928746"
    else
      url "https://dist.inference.sh/cli/v1.18.58/inferencesh-cli-v1.18.58-darwin-amd64.tar.gz"
      sha256 "0cc6bcc05ee40c8b417bd9b0748050ff6be2e793caae8916acd179f1ec58a6e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.58/inferencesh-cli-v1.18.58-linux-arm64.tar.gz"
      sha256 "ae0554949865b03ee60b0c142f4a4da7fb8b1c9e99444686b7064284ad9b4132"
    else
      url "https://dist.inference.sh/cli/v1.18.58/inferencesh-cli-v1.18.58-linux-amd64.tar.gz"
      sha256 "16c7c896afe5b8271ef73ee944d929c542f81ca85cdb68d84df7be9daa9bc200"
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
