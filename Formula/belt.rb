class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.3/inferencesh-cli-v1.25.3-darwin-arm64.tar.gz"
      sha256 "bbd361d7e8023d8eeeb93544f7562bc45ac4fbb4b960f68ed1afc225a65a5783"
    else
      url "https://dist.inference.sh/cli/v1.25.3/inferencesh-cli-v1.25.3-darwin-amd64.tar.gz"
      sha256 "e8e9a501ca3f45a517cc1124e7f7182cebf9a91925fd2fb7a9009d1f650a1054"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.3/inferencesh-cli-v1.25.3-linux-arm64.tar.gz"
      sha256 "43fe6611b0cb865d685e2d666bb572169858bb0a028c7bd3ae9f4468a0c83478"
    else
      url "https://dist.inference.sh/cli/v1.25.3/inferencesh-cli-v1.25.3-linux-amd64.tar.gz"
      sha256 "21ac81d410b2c9987f92eb54074e864ff97a9e1054583f95494dab0c41e78b83"
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
