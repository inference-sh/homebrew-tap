class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.18/inferencesh-cli-v1.28.18-darwin-arm64.tar.gz"
      sha256 "b5e456ce8a5ed18033989bb43e24632d32c213cccc6fcac5a2f02026e30e396a"
    else
      url "https://dist.inference.sh/cli/v1.28.18/inferencesh-cli-v1.28.18-darwin-amd64.tar.gz"
      sha256 "4455c0e563ffe1369de39f35a0b25d5b8e646929cc4785e111f581c6cd592899"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.18/inferencesh-cli-v1.28.18-linux-arm64.tar.gz"
      sha256 "5c62689c7e0b1bd9a48ce6d4c0c0827adf6469670c2b378f7e2d2ddd9fc721fb"
    else
      url "https://dist.inference.sh/cli/v1.28.18/inferencesh-cli-v1.28.18-linux-amd64.tar.gz"
      sha256 "acc4265ed19e4e024ee9a8ff7ddcfbdca8e28eca45a8128e495647ba793a59a6"
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
