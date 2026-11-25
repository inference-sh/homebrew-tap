class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.13/inferencesh-cli-v1.29.13-darwin-arm64.tar.gz"
      sha256 "fe408267ec69aef0f02dc7fee6785e66a573416c34db754a2d47cde5e4e4dee6"
    else
      url "https://dist.inference.sh/cli/v1.29.13/inferencesh-cli-v1.29.13-darwin-amd64.tar.gz"
      sha256 "bf589ebfc0bfed2d5dd709c73685f3c10290747d85c5f48db59be2920abc10f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.13/inferencesh-cli-v1.29.13-linux-arm64.tar.gz"
      sha256 "7f9b1f5b52538095f8e10895ad3762e120bb1238d58a1515d591612da16c5267"
    else
      url "https://dist.inference.sh/cli/v1.29.13/inferencesh-cli-v1.29.13-linux-amd64.tar.gz"
      sha256 "8b7e8a42bc69111824c0a57c1c40df78bb47decff09c76942b3baa9836b8169e"
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
