class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.28/inferencesh-cli-v1.17.28-darwin-arm64.tar.gz"
      sha256 "dd179c00aaa393e05e373d3b3058252816fcce22df93741c20e4e70418ceffa4"
    else
      url "https://dist.inference.sh/cli/v1.17.28/inferencesh-cli-v1.17.28-darwin-amd64.tar.gz"
      sha256 "43a410e6c539a1fbeefa0e9aa49626ad5c46ecb3dce70558185142445054c46c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.28/inferencesh-cli-v1.17.28-linux-arm64.tar.gz"
      sha256 "7486fc2b321fc2125aa1e413992b5de5724e22867576a0dcc233d0047f616df5"
    else
      url "https://dist.inference.sh/cli/v1.17.28/inferencesh-cli-v1.17.28-linux-amd64.tar.gz"
      sha256 "9ad9c9a68837ee11499897a3301d9be37c89a252b753d6e81d62b7c57ece26be"
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
