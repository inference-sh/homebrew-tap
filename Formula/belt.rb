class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.15-2-g3eded3a"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.15-2-g3eded3a/inferencesh-cli-v1.16.15-2-g3eded3a-darwin-arm64.tar.gz"
      sha256 "eaf8529239cbc07376228fff4bf3304d35a48c9abb54809cff269f612fc53bb3"
    else
      url "https://dist.inference.sh/cli/v1.16.15-2-g3eded3a/inferencesh-cli-v1.16.15-2-g3eded3a-darwin-amd64.tar.gz"
      sha256 "bff120a917799d587b097f557671216748822551f68a21ca786815386ea46a45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.15-2-g3eded3a/inferencesh-cli-v1.16.15-2-g3eded3a-linux-arm64.tar.gz"
      sha256 "708eb2a7dffe1f1bf5e0cca54bf310642c20845bd1142f37e1b6c841eb0e4757"
    else
      url "https://dist.inference.sh/cli/v1.16.15-2-g3eded3a/inferencesh-cli-v1.16.15-2-g3eded3a-linux-amd64.tar.gz"
      sha256 "3679f68acbc4d6fa7152c854a63054e845a7b8c49a268a95227d65ced2df335a"
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
