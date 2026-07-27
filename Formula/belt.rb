class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.1/inferencesh-cli-v1.16.1-darwin-arm64.tar.gz"
      sha256 "06b08ecaf8592953ed086ebd442d12a567c985231f140951ec6a1a3723721773"
    else
      url "https://dist.inference.sh/cli/v1.16.1/inferencesh-cli-v1.16.1-darwin-amd64.tar.gz"
      sha256 "773a4ec0f2799367ce8408a3dc5b0939159827e15d4e9a48035002a64c9d3860"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.1/inferencesh-cli-v1.16.1-linux-arm64.tar.gz"
      sha256 "d26d22d6a33cb6168e26a72dbd8560493f789d7084141f649cc8e4e812688b1e"
    else
      url "https://dist.inference.sh/cli/v1.16.1/inferencesh-cli-v1.16.1-linux-amd64.tar.gz"
      sha256 "d3429c9c79eeceb61572f770e94ee5a39895e29ebfacecad45816bdcf2878423"
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
