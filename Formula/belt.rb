class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.14.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.3-darwin-arm64.tar.gz"
      sha256 "db1f2c47d421aaeccde44ddba062d17fde509f6bb8533fc40903836619a0cdb8"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.3-darwin-amd64.tar.gz"
      sha256 "edaad389509875e204de389492038f88f8fc23ec0681076311d888d6e86397e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.3-linux-arm64.tar.gz"
      sha256 "ac50c3ac987de7015d3269c2a6c0c8f2a3109f5f38055fd02fe501fb898762d9"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.3-linux-amd64.tar.gz"
      sha256 "e15ce94b612da7e159d68a3d118d7ac241e329168ac5202c097a7271516fbabe"
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
