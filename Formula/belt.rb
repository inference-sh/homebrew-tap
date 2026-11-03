class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.16/inferencesh-cli-v1.28.16-darwin-arm64.tar.gz"
      sha256 "01170e5578e0cc79ed39913228ce59f914f39cda482ccdcbe3b16ecce03b0dad"
    else
      url "https://dist.inference.sh/cli/v1.28.16/inferencesh-cli-v1.28.16-darwin-amd64.tar.gz"
      sha256 "ad9db15e06227b30d462f730a581651a7365d1423845fed774916b52eb31e2db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.16/inferencesh-cli-v1.28.16-linux-arm64.tar.gz"
      sha256 "5eabe2b0793ab8b19944e0bb6aeae9c12e76c42439213d5240a8f6f1755aea3d"
    else
      url "https://dist.inference.sh/cli/v1.28.16/inferencesh-cli-v1.28.16-linux-amd64.tar.gz"
      sha256 "66ea80ec3bd2bea7a8b48fe89320f8bd6408453bffb135ae2de8f1ee90163adf"
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
