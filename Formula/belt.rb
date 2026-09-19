class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.42"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.42/inferencesh-cli-v1.18.42-darwin-arm64.tar.gz"
      sha256 "7c371d8643ce80ddf5cc6821bfe189570bf38252ac4faf02b4f839528f7ecff3"
    else
      url "https://dist.inference.sh/cli/v1.18.42/inferencesh-cli-v1.18.42-darwin-amd64.tar.gz"
      sha256 "ff2afd315c323a1340aa8d53d9f8eac84411815aa2db51d3980177ac51760202"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.42/inferencesh-cli-v1.18.42-linux-arm64.tar.gz"
      sha256 "863e834687a394fae08d9e18bfc895eb901ba60d12d79f990babb8d33f1469ca"
    else
      url "https://dist.inference.sh/cli/v1.18.42/inferencesh-cli-v1.18.42-linux-amd64.tar.gz"
      sha256 "2bc40ae8bb58959ed0a5f58b3697d6ef2feb4be2b5f9772cc68b683f27f3c5db"
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
