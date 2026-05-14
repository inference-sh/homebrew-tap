class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.15-darwin-arm64.tar.gz"
      sha256 "2860f852ba6cdee821a8a88eb95efcb426e980b6a1689b74a635ace17b89c4d1"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.15-darwin-amd64.tar.gz"
      sha256 "c7544fb7347b99bf505024f23121bcc2fe4456922a65bcf5be0f121fbb3f4730"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.15-linux-arm64.tar.gz"
      sha256 "d25f7b2f0b70651c222f5e22978c1ae882241100455df058f1fb5a4aea41c7c6"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.15-linux-amd64.tar.gz"
      sha256 "8bb95ac5cb935d5c86a2948c633f58762f685a88eee4824b48ab941fe62f4ca9"
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
