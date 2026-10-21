class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.7/inferencesh-cli-v1.26.7-darwin-arm64.tar.gz"
      sha256 "13a26a284a8097a3b0642c42f543041e15e89beb5cd23f263503ae8425cd3846"
    else
      url "https://dist.inference.sh/cli/v1.26.7/inferencesh-cli-v1.26.7-darwin-amd64.tar.gz"
      sha256 "efd20e2f4354a3ff61d6fdb9610d4f92062bbf3fd593e15e87a6286e8009748c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.7/inferencesh-cli-v1.26.7-linux-arm64.tar.gz"
      sha256 "41eed0d64c7aec95897057f43c19f3c18b24818632924cd635db0cd0561540d8"
    else
      url "https://dist.inference.sh/cli/v1.26.7/inferencesh-cli-v1.26.7-linux-amd64.tar.gz"
      sha256 "6c669dccbaec854deb21f3a7fe44e47d793eb2496708e2451421aef5c15ea60a"
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
