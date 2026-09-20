class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.50"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.50/inferencesh-cli-v1.18.50-darwin-arm64.tar.gz"
      sha256 "1750aebf34dedde3ff913a7afd2679eaf624d11c2872687f05b98c757ab69a97"
    else
      url "https://dist.inference.sh/cli/v1.18.50/inferencesh-cli-v1.18.50-darwin-amd64.tar.gz"
      sha256 "d586e6bb0e292eb5c04ca3ab1bf1a71e328fde21993641a694b488eb16e716d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.50/inferencesh-cli-v1.18.50-linux-arm64.tar.gz"
      sha256 "c2098680e81fb8c85d48052b921419df8a500284219ea080bd4bd648a9b60fcd"
    else
      url "https://dist.inference.sh/cli/v1.18.50/inferencesh-cli-v1.18.50-linux-amd64.tar.gz"
      sha256 "9a38afcd46ade4178738b0a39d7d28c215302eae8d70b0b6bcbacf968d7e4da6"
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
