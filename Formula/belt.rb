class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.4/inferencesh-cli-v1.18.4-darwin-arm64.tar.gz"
      sha256 "144ecdee62ebb7e841abcbf027a96170376a949c05d3c9b6fd7a092f9d766935"
    else
      url "https://dist.inference.sh/cli/v1.18.4/inferencesh-cli-v1.18.4-darwin-amd64.tar.gz"
      sha256 "392b12f48d044fa9312eec798ff0888e090310817184a457a57835c7f8da5197"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.4/inferencesh-cli-v1.18.4-linux-arm64.tar.gz"
      sha256 "60043044781e6d69eb642d5549d99df288b25df4f38863e6779120a2eeda7ca0"
    else
      url "https://dist.inference.sh/cli/v1.18.4/inferencesh-cli-v1.18.4-linux-amd64.tar.gz"
      sha256 "bd92bfe06afc12f4ab868f197f9fdf8e676703e55e18199a21b527aeb60e0eca"
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
