class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.21.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.21.0/inferencesh-cli-v1.21.0-darwin-arm64.tar.gz"
      sha256 "9ee63ed8cb62235991ddd8faeedabdb33dc635cdea8ae218598cfdf2350337ff"
    else
      url "https://dist.inference.sh/cli/v1.21.0/inferencesh-cli-v1.21.0-darwin-amd64.tar.gz"
      sha256 "7f82090e14af31f83e0ae4d3a6e4c5fbe67be3f1f9828734879e8f3830499cc6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.21.0/inferencesh-cli-v1.21.0-linux-arm64.tar.gz"
      sha256 "e5b9c4a205361c949a4891b6be18022278f315f1810191ba8c9f36ad5f3a2329"
    else
      url "https://dist.inference.sh/cli/v1.21.0/inferencesh-cli-v1.21.0-linux-amd64.tar.gz"
      sha256 "3172ef3f60b180c68d8f7a9666e30c04675ccc66931addd583998f0007d4369e"
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
