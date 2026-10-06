class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.16/inferencesh-cli-v1.19.16-darwin-arm64.tar.gz"
      sha256 "2c4c028dba16d5edd72b8e3d4125792a48b60b000a75209bf844aa6ea4e91ab0"
    else
      url "https://dist.inference.sh/cli/v1.19.16/inferencesh-cli-v1.19.16-darwin-amd64.tar.gz"
      sha256 "f46c89a47de677dcea649107374c829c96fcb42b584406df95f4f0e5b197e53d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.16/inferencesh-cli-v1.19.16-linux-arm64.tar.gz"
      sha256 "8fde42831ad559e6ea8241c87016342082216865d4d013a2c07e7fd34918c9ed"
    else
      url "https://dist.inference.sh/cli/v1.19.16/inferencesh-cli-v1.19.16-linux-amd64.tar.gz"
      sha256 "f893cd38858d365e0f64a5cc1ea465cdf75180f97256220cf472fca58edf6c0d"
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
