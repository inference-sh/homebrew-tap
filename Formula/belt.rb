class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.8-darwin-arm64.tar.gz"
      sha256 "f82ea0ecf4e348b74baf25be318e944a5d8cc80a4f58303f776a0c9d3845d84d"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.8-darwin-amd64.tar.gz"
      sha256 "f8643b5d685a748dd41b6f20e7e2bbf0eb229510f8e75558b052413088a1a8c5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.8-linux-arm64.tar.gz"
      sha256 "984cf1989966d89f624726bec8d9687128e18f50d49bcc50182b80e30f86527b"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.8-linux-amd64.tar.gz"
      sha256 "ff551f811c6992f8715e16c00e7176b733ed12a475c9c42b8d8a02cc7261b0b2"
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
