class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.31/inferencesh-cli-v1.28.31-darwin-arm64.tar.gz"
      sha256 "a5d405fcd98a7c0d31212bdb2600906faa05ca5f474391369ddab7b56e223fd7"
    else
      url "https://dist.inference.sh/cli/v1.28.31/inferencesh-cli-v1.28.31-darwin-amd64.tar.gz"
      sha256 "161ab5e251e24a49babc3e0499fec179b0390f0af380cd8533909f73acaf0dcb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.31/inferencesh-cli-v1.28.31-linux-arm64.tar.gz"
      sha256 "747ac49f6b3f406c105c328485d14eea45affb20e3828252cde3b6ae0508a074"
    else
      url "https://dist.inference.sh/cli/v1.28.31/inferencesh-cli-v1.28.31-linux-amd64.tar.gz"
      sha256 "e36e2936672df6522942f5a1a04f485c1b05fbe28a97bda429947ab2009fc543"
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
