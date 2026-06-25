class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.14.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.4-darwin-arm64.tar.gz"
      sha256 "56c8ddd0ff863b6ee9e7c009432bf906ebb26e896a25b316dc697648e5eaf541"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.4-darwin-amd64.tar.gz"
      sha256 "b7572b8ec1f8e9ee047bcff0b1a7d8313ff46ece551fa082bf7885dfc196c983"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.4-linux-arm64.tar.gz"
      sha256 "b353e4f0771a29aebac540f1c7d976698bbcc620537e705cd325b8856bac4f75"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.4-linux-amd64.tar.gz"
      sha256 "ec09702a7ff5fd65dd1ae9e152daae45cd8cccfd520f6b396468dff3b344b619"
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
