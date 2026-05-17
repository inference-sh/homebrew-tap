class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.13-darwin-arm64.tar.gz"
      sha256 "4b97218d8b9a22b1ed26673fade5f6ea3f6a651733eb4b2d31c596af43161828"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.13-darwin-amd64.tar.gz"
      sha256 "7b3d4f78936f89676460a563069d81fa8fdbdab57f20ff964ecd93a4988df3f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.13-linux-arm64.tar.gz"
      sha256 "a2a3d0e7853b0401fc17efa6b94e5178fc8abda2d4b09cd4d2e1e19202eba3d3"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.13-linux-amd64.tar.gz"
      sha256 "a7fed7da48c88d874286ff0798562e4db5dcd22c7029a9343075396071dfb637"
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
