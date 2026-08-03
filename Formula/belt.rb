class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.21/inferencesh-cli-v1.16.21-darwin-arm64.tar.gz"
      sha256 "48d138e8afd8820e5a33fbfa941a02f1d7bdfe41d663b8291da8d663be028909"
    else
      url "https://dist.inference.sh/cli/v1.16.21/inferencesh-cli-v1.16.21-darwin-amd64.tar.gz"
      sha256 "fc1805381a6a9c64fff9fbb24ca1f26a41a4035dbd71be3d28025084d68edf7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.21/inferencesh-cli-v1.16.21-linux-arm64.tar.gz"
      sha256 "7fa40ec9fa636e7578ec90777f5e7f05a818ac829de2500a8374b454384ff3a0"
    else
      url "https://dist.inference.sh/cli/v1.16.21/inferencesh-cli-v1.16.21-linux-amd64.tar.gz"
      sha256 "5d2e8ed23788da3f9170b88612d6a4f13bd2b6c90186d45c77a7bdb3baf78fd1"
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
