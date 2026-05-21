class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.3-darwin-arm64.tar.gz"
      sha256 "95af92f6064aba84eade6021ff5a12ec83d43f7e611a3c27179b53d8ad08f35e"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.3-darwin-amd64.tar.gz"
      sha256 "0a9a27f374a43e21e92b3affbc2a20a1d25df75840ff4113c17a5a8ea809eb2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.3-linux-arm64.tar.gz"
      sha256 "f72e89ff2758dbe748cc055e78e5fcc6335714b831861a3ea2b35748ac870591"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.3-linux-amd64.tar.gz"
      sha256 "e26e81ec23969eb47176439d23bc7333dcd09185fb8718a258faa1c7287558d4"
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
