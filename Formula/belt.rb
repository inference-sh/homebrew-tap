class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.12-darwin-arm64.tar.gz"
      sha256 "7ab9df0688eb2198e67ec1f6d2130f74a55a839a139717968d70a5f6ee01373b"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.12-darwin-amd64.tar.gz"
      sha256 "2f43cb2b74be1e43bcad3f9d0d62e390a31173d07c3fbea2ca6461b3adc7f7b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.12-linux-arm64.tar.gz"
      sha256 "ad511f6e0608f52cf3a937e2cdc07ef50e2f98303dc91ede935f8a718e0a997d"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.12-linux-amd64.tar.gz"
      sha256 "3e1cb7cf628f273ff20bd4dd2676e9cfc63d9be88c4b1037549cb54854da775e"
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
