class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.5/inferencesh-cli-v1.25.5-darwin-arm64.tar.gz"
      sha256 "e768762aaef6a1b68d91baa3a2ca522d55651c301993a522b71964c620a4379c"
    else
      url "https://dist.inference.sh/cli/v1.25.5/inferencesh-cli-v1.25.5-darwin-amd64.tar.gz"
      sha256 "b0abecde56275dde1ca3eca40b34140372ed84ad1e01f227b2fa5b5ca263b5fa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.5/inferencesh-cli-v1.25.5-linux-arm64.tar.gz"
      sha256 "7de6205d0f4fd5b4cf14d274aa10e1ed9fc90a5b7e7199b7639c7755c353e3dd"
    else
      url "https://dist.inference.sh/cli/v1.25.5/inferencesh-cli-v1.25.5-linux-amd64.tar.gz"
      sha256 "9b80c8bb94aea89d32f65c66a2199672eafb0944c64f82644be0d3c2d9008453"
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
