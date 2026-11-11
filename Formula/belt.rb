class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.38"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.38/inferencesh-cli-v1.28.38-darwin-arm64.tar.gz"
      sha256 "8a17f19395efcee1fbe1eb37baa20106cb996e4f43c4316e0bf97563911e92f6"
    else
      url "https://dist.inference.sh/cli/v1.28.38/inferencesh-cli-v1.28.38-darwin-amd64.tar.gz"
      sha256 "f275482dbe1b39c658be66cceb3c304d31cde2efc5d06dcc597448eb89d96196"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.38/inferencesh-cli-v1.28.38-linux-arm64.tar.gz"
      sha256 "0e9dc924ef7dd587fde92a99d854a4f4a48b87689e2c7216cc1e34c01b609d26"
    else
      url "https://dist.inference.sh/cli/v1.28.38/inferencesh-cli-v1.28.38-linux-amd64.tar.gz"
      sha256 "d9a94756921a6c3de3ab954aebaa64e5444535511ac3461c91cd03ff1126490e"
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
