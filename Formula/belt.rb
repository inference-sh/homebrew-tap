class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.11/inferencesh-cli-v1.16.11-darwin-arm64.tar.gz"
      sha256 "2e2b9fe818454c68881a1347a49057cea735301a434e87fd927fccbaa7aee30e"
    else
      url "https://dist.inference.sh/cli/v1.16.11/inferencesh-cli-v1.16.11-darwin-amd64.tar.gz"
      sha256 "c79fa1062c3deac57aa9415e2bbc43ef32c7852a47e636f1b47f45e7e9c0de98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.11/inferencesh-cli-v1.16.11-linux-arm64.tar.gz"
      sha256 "534057129a432381b9eb41983a7549263f9907904449b26eb700b334ec6e7368"
    else
      url "https://dist.inference.sh/cli/v1.16.11/inferencesh-cli-v1.16.11-linux-amd64.tar.gz"
      sha256 "88a356a31a46a1636955b58e9b617550808627e59c31f5e24e40743d9bd7794b"
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
