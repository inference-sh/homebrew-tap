class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.18/inferencesh-cli-v1.26.18-darwin-arm64.tar.gz"
      sha256 "e9ea1a6a19944935c3a57695360923efc4257ec2be6f0839a186476879dd503e"
    else
      url "https://dist.inference.sh/cli/v1.26.18/inferencesh-cli-v1.26.18-darwin-amd64.tar.gz"
      sha256 "7ba9516edd82399084da28bd51dba4b68d2f273a77607cf940beba02be66b53d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.18/inferencesh-cli-v1.26.18-linux-arm64.tar.gz"
      sha256 "5dc73558f1b40ec15848f2b7fb0754ccc17dc9589457ba22b333568beb385627"
    else
      url "https://dist.inference.sh/cli/v1.26.18/inferencesh-cli-v1.26.18-linux-amd64.tar.gz"
      sha256 "9a740f1db0cf9b4818f90510d45b3dc5f098cea8906f3d39f72b3a886d86bee5"
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
