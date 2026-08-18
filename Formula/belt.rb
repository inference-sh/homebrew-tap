class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.17/inferencesh-cli-v1.17.17-darwin-arm64.tar.gz"
      sha256 "a57f6bb10149f23d987d7c99f6692ea7b0354bb6197673320cbbe030d9abc2d4"
    else
      url "https://dist.inference.sh/cli/v1.17.17/inferencesh-cli-v1.17.17-darwin-amd64.tar.gz"
      sha256 "eb28480619f63e3a885b4e43fbb5f13c05b265940774002861fd4736e3437688"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.17/inferencesh-cli-v1.17.17-linux-arm64.tar.gz"
      sha256 "033ffb7b78c083dee519d0a1e758cdc9b135deed9bc4fd714e06837586d9d285"
    else
      url "https://dist.inference.sh/cli/v1.17.17/inferencesh-cli-v1.17.17-linux-amd64.tar.gz"
      sha256 "9eb67d58b9da23b1a9326876b52c7d6f9e1e223868a5b8c1bf6932232c57c19c"
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
