class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.24.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.4/inferencesh-cli-v1.24.4-darwin-arm64.tar.gz"
      sha256 "da2b60cfa2b5303c3c91a99beb71b22c2ddec118eab39b7b8c67596029691d8a"
    else
      url "https://dist.inference.sh/cli/v1.24.4/inferencesh-cli-v1.24.4-darwin-amd64.tar.gz"
      sha256 "bc5d3e76e965649d9b1253bfebfb1372ea86242b8dad7f0ee3aa06a3139074f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.4/inferencesh-cli-v1.24.4-linux-arm64.tar.gz"
      sha256 "d96534d0b948c464f9fecd423618d93bce916d5ceb15a4a88a02c04708401c05"
    else
      url "https://dist.inference.sh/cli/v1.24.4/inferencesh-cli-v1.24.4-linux-amd64.tar.gz"
      sha256 "2b81b2fb8b22a9f72be3215a03115e5cd6b31b9fa6ca835df4b538346c81c55c"
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
