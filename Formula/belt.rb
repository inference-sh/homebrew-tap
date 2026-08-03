class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.20/inferencesh-cli-v1.16.20-darwin-arm64.tar.gz"
      sha256 "34c8b52eab52b638c75e186d5d5eb8efccc7a47ba75ecb3a07352296276a0a10"
    else
      url "https://dist.inference.sh/cli/v1.16.20/inferencesh-cli-v1.16.20-darwin-amd64.tar.gz"
      sha256 "d4e41bfaf7f8e3d70192ad5e5ad3ef7cf9619a908b51fedecac6bc60376e0d54"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.20/inferencesh-cli-v1.16.20-linux-arm64.tar.gz"
      sha256 "fa65812083ea4ed7be969039424b289ccc51ed8e45059f2ff528bab2d070db05"
    else
      url "https://dist.inference.sh/cli/v1.16.20/inferencesh-cli-v1.16.20-linux-amd64.tar.gz"
      sha256 "c6af23b02d17655c2f9e1449f49cb0a2b32bac87f910074708d8fbbacf8714e4"
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
