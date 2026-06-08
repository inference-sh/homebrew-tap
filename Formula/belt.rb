class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.30-darwin-arm64.tar.gz"
      sha256 "23c2b1339b53d3df056f38356e229a68fd39e0230c59fe155350512f230954d1"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.30-darwin-amd64.tar.gz"
      sha256 "22eecf700204e4c84ada6dd5463a324ec236f48d9743c04c83cfd898629f4816"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.30-linux-arm64.tar.gz"
      sha256 "a3c62eccbb1dda08260c235422b7315c7fa40266c28714e3fab614391551653d"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.30-linux-amd64.tar.gz"
      sha256 "ae4d3917744cc711582f2529eac0d62b62078f1927e961495047039a836593b5"
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
