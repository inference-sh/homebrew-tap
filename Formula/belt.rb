class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.13-darwin-arm64.tar.gz"
      sha256 "f62500cb17ece3457f200f60ffdd40daf27de50c00a256294b2dedeb903355e9"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.13-darwin-amd64.tar.gz"
      sha256 "7ad03a488dee14cbbb386cf3a784330c942d484786b2f966154c54c75f876a84"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.13-linux-arm64.tar.gz"
      sha256 "f79a4c0798c80ae1ac71b94a34581fd0c160485f71833d9514437e07694ee409"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.13-linux-amd64.tar.gz"
      sha256 "9273489954fee9aaf461895ecaa40b1bf6010e3816574acd1f7a21dc0dd85a8e"
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
