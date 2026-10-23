class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.15/inferencesh-cli-v1.26.15-darwin-arm64.tar.gz"
      sha256 "ab94fd1fe14f03da6527860652663a5348841b5728311fb83e8764866bc0252e"
    else
      url "https://dist.inference.sh/cli/v1.26.15/inferencesh-cli-v1.26.15-darwin-amd64.tar.gz"
      sha256 "fe081c84df458fdd34c0c91f15588288a50cdb38951cffd6bb85c12dc5db054f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.15/inferencesh-cli-v1.26.15-linux-arm64.tar.gz"
      sha256 "bea62eac98dde303885a8670528ef6ff5abbcae1cd8d758f51cfd3fe74adbabf"
    else
      url "https://dist.inference.sh/cli/v1.26.15/inferencesh-cli-v1.26.15-linux-amd64.tar.gz"
      sha256 "99d1e0b8a2c67333d082154dfa86a3e2db2a2cd84ecd1299637163b3fd538c78"
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
