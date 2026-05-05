class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.7-dirty"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.7-dirty-darwin-arm64.tar.gz"
      sha256 "1f355495a92410b80cbe88c2a003457c88d62b973f85de455eea90db8107ca31"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.7-dirty-darwin-amd64.tar.gz"
      sha256 "dc88cff97f045538a6a2cafefe6f99e268882bb8110b48b6d1df8aec842564da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.7-dirty-linux-arm64.tar.gz"
      sha256 "665968a4b5eb19a58ccb67e3b375f7583f0517ef77484fd0d5933c85eb04c668"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.7-dirty-linux-amd64.tar.gz"
      sha256 "14f17ebbfee8172d731c87ef7f70389de5f312aadf058fc145032913f308f015"
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
