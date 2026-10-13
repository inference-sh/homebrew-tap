class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.24.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.3/inferencesh-cli-v1.24.3-darwin-arm64.tar.gz"
      sha256 "10fd396e8c16218f9e2ae29957a07dcd110c71fb9102e3c477b0441e01bc4762"
    else
      url "https://dist.inference.sh/cli/v1.24.3/inferencesh-cli-v1.24.3-darwin-amd64.tar.gz"
      sha256 "6fdad6bfaa3df51e04fcad99d432621b764351097b54d8cecf53d2496a22c733"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.3/inferencesh-cli-v1.24.3-linux-arm64.tar.gz"
      sha256 "95910bb447623378be4459e0069563df00f716a00d553bd6ccfe647727e0a11c"
    else
      url "https://dist.inference.sh/cli/v1.24.3/inferencesh-cli-v1.24.3-linux-amd64.tar.gz"
      sha256 "f3631d0e937518749ad058d1cf3e6f8ed639a356c294c8ebbcdf4b652324ee66"
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
