class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.5-darwin-arm64.tar.gz"
      sha256 "93defc2b9986d66e1fa6adcc4ccd3e9d440f77be1278fdb7415bc15b2dc3f3e0"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.5-darwin-amd64.tar.gz"
      sha256 "9974ca6536fef7be168037f140d2e3bc311bb98de144329007e14ee38af4843d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.5-linux-arm64.tar.gz"
      sha256 "3cbef92a1e8a009c267e1d10b210c42a1bbf7cd6776a43dd410de53508ab4401"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.5-linux-amd64.tar.gz"
      sha256 "2a71d5b5955eae3fb86735d8c5682899c80f4d3d96c3df884782839ea59d0102"
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
