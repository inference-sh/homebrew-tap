class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.13/inferencesh-cli-v1.15.13-darwin-arm64.tar.gz"
      sha256 "9ab4b93cf611abfafbd0047c60d7a2225155aee56dc02d4b321646b505ebc17b"
    else
      url "https://dist.inference.sh/cli/v1.15.13/inferencesh-cli-v1.15.13-darwin-amd64.tar.gz"
      sha256 "52c533333211d409e3dd9acca841c2297894f2676513a9a187cd202d7ebc1ea7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.13/inferencesh-cli-v1.15.13-linux-arm64.tar.gz"
      sha256 "6eb24bf84f4b32476e0e3f9dc4ace10d673e654aa5cc71b1ba7f6ad8ca53836d"
    else
      url "https://dist.inference.sh/cli/v1.15.13/inferencesh-cli-v1.15.13-linux-amd64.tar.gz"
      sha256 "5ad472deb47ce26f3cde2171bbf8732e167278e7de1e10eb7ec8889a49f6c6e4"
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
