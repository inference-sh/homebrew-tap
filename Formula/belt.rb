class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.1-darwin-arm64.tar.gz"
      sha256 "1465c38cc4fc4ae56b609b5e6f03d056fe0b8bb12b57d22410b122f02e1aaad8"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.1-darwin-amd64.tar.gz"
      sha256 "cb3a1fc1af477a987397d91e899daae03e3685c2a9093c1442fbed64e93887eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.1-linux-arm64.tar.gz"
      sha256 "f9d4113fcc72459990a71a1aaa108141c4d669045b9216527980c71f36984072"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.1-linux-amd64.tar.gz"
      sha256 "9cbaa058a4c367aa2f378acd889591d9df336870a437b3ef735d782cc935397e"
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
