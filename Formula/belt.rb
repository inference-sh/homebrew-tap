class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.15/inferencesh-cli-v1.29.15-darwin-arm64.tar.gz"
      sha256 "cc1960a22f5446a0f756edd7940c0315e9ba945cbad081757d0ed279002646a5"
    else
      url "https://dist.inference.sh/cli/v1.29.15/inferencesh-cli-v1.29.15-darwin-amd64.tar.gz"
      sha256 "be3455f84bf2b1f83e789c944ee20a49282678a515fbeadaf654ff20a5fdd974"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.15/inferencesh-cli-v1.29.15-linux-arm64.tar.gz"
      sha256 "f73b626def47700ae6606145986bb14c0c56dec0158cbe160a15f27013e43614"
    else
      url "https://dist.inference.sh/cli/v1.29.15/inferencesh-cli-v1.29.15-linux-amd64.tar.gz"
      sha256 "b01a485a7ecac015b818659701f42e508f6f2142dd35027a71f1ab40ca21c6f1"
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
