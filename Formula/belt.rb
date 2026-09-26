class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.0/inferencesh-cli-v1.19.0-darwin-arm64.tar.gz"
      sha256 "2a0b93f851bc58d8d19a137a32129f586c872d9208e9e0094ab7e1ec623148dd"
    else
      url "https://dist.inference.sh/cli/v1.19.0/inferencesh-cli-v1.19.0-darwin-amd64.tar.gz"
      sha256 "01fb10e9a39e3e24eed11b298f888fa1c5b29ae1e9a382c1d643bb92629cf465"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.0/inferencesh-cli-v1.19.0-linux-arm64.tar.gz"
      sha256 "f1ef36d710336a291cffa0513cb478d0750a9c0ae6f31881597177797cbd71c1"
    else
      url "https://dist.inference.sh/cli/v1.19.0/inferencesh-cli-v1.19.0-linux-amd64.tar.gz"
      sha256 "5da11546f11b7494e62551795953bdc58f3abf7101228e4b787d5f82565c8642"
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
