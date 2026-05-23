class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.10-darwin-arm64.tar.gz"
      sha256 "0d1601bc1c5a5d62cc28b22f1da8fb3be937161cf056adf0d0f25fbdffa3ea1c"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.10-darwin-amd64.tar.gz"
      sha256 "822b17171076aafdf6c00d0c081d9f5b1d9fcc11c0b2c1415c15ef1405b7d11d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.10-linux-arm64.tar.gz"
      sha256 "bd4d6ea93b3f2600b7512e4bf53312c2c57f33e26cf3e23741c9e19b3953edc0"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.10-linux-amd64.tar.gz"
      sha256 "3bfdbb89e43db04b067c774f12e2e47d043da6e4223b825dff72ec73d65a71a5"
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
