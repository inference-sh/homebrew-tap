class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.17-darwin-arm64.tar.gz"
      sha256 "febe03608b20e207323dc9307c723cee21487fe9ccb16c14484a511d5b893d8d"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.17-darwin-amd64.tar.gz"
      sha256 "25d6c94987f37c255ad974bf0672753cc6b75c4deea5d3102fbf1b6e01a184f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.17-linux-arm64.tar.gz"
      sha256 "59c0310de3662dc6fb83ddf94ac5f43e51414737583bbfb9f44e15f59b7d9050"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.17-linux-amd64.tar.gz"
      sha256 "6029f73a57cd4fe34f32fcfde17aa9925c4cebce28fdc4ca9d2a403bdb54f243"
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
