class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.10/inferencesh-cli-v1.25.10-darwin-arm64.tar.gz"
      sha256 "ad8476ca68af191a4df0a4a0ce037949801de859b02ce81fc984a015c6a77340"
    else
      url "https://dist.inference.sh/cli/v1.25.10/inferencesh-cli-v1.25.10-darwin-amd64.tar.gz"
      sha256 "bea98aa23f3e5751a297ff14cd1af867e16dbed40a3fe58dbf984039c739606f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.10/inferencesh-cli-v1.25.10-linux-arm64.tar.gz"
      sha256 "8eea7fa4ca4613fb81d0ef4479e45feefea9ac4ee11e0e54b33e5a09ec6257b8"
    else
      url "https://dist.inference.sh/cli/v1.25.10/inferencesh-cli-v1.25.10-linux-amd64.tar.gz"
      sha256 "c8506a537d95696a9511f0d82c392a17005eabf443493274d5cfcf3537a6d7b6"
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
