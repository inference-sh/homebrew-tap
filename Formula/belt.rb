class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.33-darwin-arm64.tar.gz"
      sha256 "89112c039e20668e81f2fec43a3ef59fc7c6af99fa3cada5fc1e8d8641bc4fb5"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.33-darwin-amd64.tar.gz"
      sha256 "f0ffdfb66649c4d48a5c82b4f6c7f82ef4869af8bba09d34795a06a8a1abb885"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.33-linux-arm64.tar.gz"
      sha256 "1d8dc3b7d6f9b00e4f717b0a634cca3f64cced83d33ec3c933086a7533b67e5d"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.33-linux-amd64.tar.gz"
      sha256 "47eb2d15ccf845a78abf663ae8b6afc5f48319c5a102a59c22568b52e2e06f77"
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
