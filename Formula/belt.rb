class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.32/inferencesh-cli-v1.28.32-darwin-arm64.tar.gz"
      sha256 "feba1d70b4273e66545af064cd48bbbcee83a6e79241ec1a3392530574fd1bab"
    else
      url "https://dist.inference.sh/cli/v1.28.32/inferencesh-cli-v1.28.32-darwin-amd64.tar.gz"
      sha256 "24642555a40549274de0a363067145d5e978f176c181651a164e551c50892e4d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.32/inferencesh-cli-v1.28.32-linux-arm64.tar.gz"
      sha256 "b083efb3f9d00d9a600db02e3c9356a4c7406fb9dabe91d848c71c80295f8b3b"
    else
      url "https://dist.inference.sh/cli/v1.28.32/inferencesh-cli-v1.28.32-linux-amd64.tar.gz"
      sha256 "e58e9e2557f9a53bbf1d37a77ea9874d15a3f22640069d71d70d8613df7ad1fc"
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
