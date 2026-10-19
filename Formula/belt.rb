class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.1/inferencesh-cli-v1.26.1-darwin-arm64.tar.gz"
      sha256 "7cc9a29a90c1c4c2132e75a2d0461f41c8979fe77317b5a6d1e351456c6fdd37"
    else
      url "https://dist.inference.sh/cli/v1.26.1/inferencesh-cli-v1.26.1-darwin-amd64.tar.gz"
      sha256 "dd99c2183700019c39205269b2f39125d46b077878428626f31ab167181f714c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.1/inferencesh-cli-v1.26.1-linux-arm64.tar.gz"
      sha256 "501a9c2e07e30b67e7bcd03fb26326004f463abd13668bdcb4830083d5e596cd"
    else
      url "https://dist.inference.sh/cli/v1.26.1/inferencesh-cli-v1.26.1-linux-amd64.tar.gz"
      sha256 "8ab4a71e1e3da8744998248258f57fed6a062afd327545e3888edbd623521cfa"
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
