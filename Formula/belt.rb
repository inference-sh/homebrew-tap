class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.15/inferencesh-cli-v1.15.15-darwin-arm64.tar.gz"
      sha256 "20b2ea3d9beef98b04804a1b521818cc822af3224734c82803d2b72f984eb70e"
    else
      url "https://dist.inference.sh/cli/v1.15.15/inferencesh-cli-v1.15.15-darwin-amd64.tar.gz"
      sha256 "f16e439b3c090fcfcc38f36060377f9f075500e2489f612842f1700122f149de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.15/inferencesh-cli-v1.15.15-linux-arm64.tar.gz"
      sha256 "e57654275bc950e9761cdaab1d6968b0889954c87739ca702a5ffceee8f9093c"
    else
      url "https://dist.inference.sh/cli/v1.15.15/inferencesh-cli-v1.15.15-linux-amd64.tar.gz"
      sha256 "d3d9d75c087982f1ac98b2697e9334d82fadfd90acd33c7b4612984826102ad9"
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
