class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.31/inferencesh-cli-v1.18.31-darwin-arm64.tar.gz"
      sha256 "e7c61e9950de2157808c0059d82c8956b9fc499e54701f638bed119adb09e242"
    else
      url "https://dist.inference.sh/cli/v1.18.31/inferencesh-cli-v1.18.31-darwin-amd64.tar.gz"
      sha256 "2be59f9b8cb0f214f495842415609b16b3895ddf3f7d03d5befb8254aa006db2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.31/inferencesh-cli-v1.18.31-linux-arm64.tar.gz"
      sha256 "f0ad3e814b7116dafa8aad2007c994ccd1f73134b58264b5aa1557ba4aa5c792"
    else
      url "https://dist.inference.sh/cli/v1.18.31/inferencesh-cli-v1.18.31-linux-amd64.tar.gz"
      sha256 "9d35193471775783ef487a93099189789c98bf368d3716f86939f05ce842fd27"
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
