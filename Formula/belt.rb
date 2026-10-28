class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.27.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.27.1/inferencesh-cli-v1.27.1-darwin-arm64.tar.gz"
      sha256 "3e534bdf47fdfa05fbf59f9f7c92dd4a3416200700a3a717a9fff2184815a516"
    else
      url "https://dist.inference.sh/cli/v1.27.1/inferencesh-cli-v1.27.1-darwin-amd64.tar.gz"
      sha256 "4a6fc966ff48e2105c4a2cf31ddc1b6347d4b49976c4dc6b5abbe5800d8064d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.27.1/inferencesh-cli-v1.27.1-linux-arm64.tar.gz"
      sha256 "22587a13c1f2d0b71ba0ec8744142ffe1108da9ef1c8cf55c65919b102ab03d5"
    else
      url "https://dist.inference.sh/cli/v1.27.1/inferencesh-cli-v1.27.1-linux-amd64.tar.gz"
      sha256 "76db7c830d2da7a455a6b72f4cfadf794e479ae60e55127d67800a360d5ece91"
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
