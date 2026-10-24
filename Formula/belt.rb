class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.16/inferencesh-cli-v1.26.16-darwin-arm64.tar.gz"
      sha256 "e642eaff7ea4c718a23c788f817380a218fd99eaea70bd4b17396ef6543fccc5"
    else
      url "https://dist.inference.sh/cli/v1.26.16/inferencesh-cli-v1.26.16-darwin-amd64.tar.gz"
      sha256 "f88848fc2a6a61a96b88f30606e06ac28033f96425e84a08d05b99e0ef9194ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.16/inferencesh-cli-v1.26.16-linux-arm64.tar.gz"
      sha256 "66ec68e3f999232c6e99f57451778a7b4a67c2a3c7670fcf905b22a90b8c22e7"
    else
      url "https://dist.inference.sh/cli/v1.26.16/inferencesh-cli-v1.26.16-linux-amd64.tar.gz"
      sha256 "c5fe6c75fc6a8f2e512ab5b172ed49c93130066bdfa1ed9020012758b337ee3c"
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
