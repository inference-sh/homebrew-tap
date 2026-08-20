class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.25/inferencesh-cli-v1.17.25-darwin-arm64.tar.gz"
      sha256 "c46595dcc665412b12c19ff29aa5f1b4979ba27701817124437c61a8cbb84561"
    else
      url "https://dist.inference.sh/cli/v1.17.25/inferencesh-cli-v1.17.25-darwin-amd64.tar.gz"
      sha256 "eeac254a9e986fef760a44ae9828b63b70b3b543d38ad5a3d3a6585d117a7a71"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.25/inferencesh-cli-v1.17.25-linux-arm64.tar.gz"
      sha256 "5865df5560b0bd4a440607ca68ee5ebf7114ef3353b651d495e1f0136be2cac3"
    else
      url "https://dist.inference.sh/cli/v1.17.25/inferencesh-cli-v1.17.25-linux-amd64.tar.gz"
      sha256 "05bb625249dde59f504393bc477eeb1b016c5d10bcd3404bb78ddad25bbb583f"
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
