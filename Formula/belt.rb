class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.6-15-gb6b3e3b"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.6-15-gb6b3e3b/inferencesh-cli-v1.15.6-15-gb6b3e3b-darwin-arm64.tar.gz"
      sha256 "b12c8b0b1b72453783ecda31548ba017caf3b380574e36b897037b72b439e421"
    else
      url "https://dist.inference.sh/cli/v1.15.6-15-gb6b3e3b/inferencesh-cli-v1.15.6-15-gb6b3e3b-darwin-amd64.tar.gz"
      sha256 "b086ea700f9471bd63a0e27899d22ff1422bdf4c118bce998869813dcb7a0a0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.6-15-gb6b3e3b/inferencesh-cli-v1.15.6-15-gb6b3e3b-linux-arm64.tar.gz"
      sha256 "736bece9866314c63cb527f2953185cbc3525682f972dee0e70f575597432c54"
    else
      url "https://dist.inference.sh/cli/v1.15.6-15-gb6b3e3b/inferencesh-cli-v1.15.6-15-gb6b3e3b-linux-amd64.tar.gz"
      sha256 "701f0b3d23c3d803ec97f597106b41e7113c62fef8887c14501105902657f4a4"
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
