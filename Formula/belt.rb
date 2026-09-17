class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.36"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.36/inferencesh-cli-v1.18.36-darwin-arm64.tar.gz"
      sha256 "9e89872ac4564e5ce429e4fa78c0b2cccc644df3aa43fc17e652cb7f37b7ec3c"
    else
      url "https://dist.inference.sh/cli/v1.18.36/inferencesh-cli-v1.18.36-darwin-amd64.tar.gz"
      sha256 "1892e4825f9337b2ac9a26d1a6b2a3df1d9268817021c253ce74c9c0b2008c8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.36/inferencesh-cli-v1.18.36-linux-arm64.tar.gz"
      sha256 "1182d8234b758e2467384515196af7044a2129eb158fba525a6648ed313c8aef"
    else
      url "https://dist.inference.sh/cli/v1.18.36/inferencesh-cli-v1.18.36-linux-amd64.tar.gz"
      sha256 "fb5e196019b43dd7554ec749746679dd3daabdc174a683ddefe6e39f82f2c7bf"
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
