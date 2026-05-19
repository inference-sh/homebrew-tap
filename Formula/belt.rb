class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.28-darwin-arm64.tar.gz"
      sha256 "1055bf510d821176f9b676bd3b42903a72e27568e1637ec580ebfeb7deb4ebcb"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.28-darwin-amd64.tar.gz"
      sha256 "f05a2ac17ae078deac3b1f2c7082c19630fd9c65e760273b52dba241ba3680c2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.28-linux-arm64.tar.gz"
      sha256 "9aa8dcd16b43a74e57c06921e2530d05e8091499ced2f8c3240b93b71ff6d8be"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.28-linux-amd64.tar.gz"
      sha256 "b50533f22bbcac7293c798ad03dd681ad39aa9d231c43cbd22d77eb9d2afd492"
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
