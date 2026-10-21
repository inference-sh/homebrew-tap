class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.6/inferencesh-cli-v1.26.6-darwin-arm64.tar.gz"
      sha256 "520d107c3e8d327659e80f9bcaff7f58bda3779806d807271794c6556a8bcbd3"
    else
      url "https://dist.inference.sh/cli/v1.26.6/inferencesh-cli-v1.26.6-darwin-amd64.tar.gz"
      sha256 "ff7f50bd96d8377da311b96502839ed42f57212afd6b0ceaa05808a8da1fa5d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.6/inferencesh-cli-v1.26.6-linux-arm64.tar.gz"
      sha256 "f457424199a9772f45ca23b43ed2b7cc605053835b2dd55d43eb26e9e91b4a24"
    else
      url "https://dist.inference.sh/cli/v1.26.6/inferencesh-cli-v1.26.6-linux-amd64.tar.gz"
      sha256 "f4b449adbf929343fe245269bad96a8deff2a16657dbdd83a2371e8a5a4a1854"
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
