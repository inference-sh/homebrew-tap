class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.23/inferencesh-cli-v1.17.23-darwin-arm64.tar.gz"
      sha256 "ce668af412ace6a5005c10010d0958bae18d323ff4315f914cd92fc2c9871f67"
    else
      url "https://dist.inference.sh/cli/v1.17.23/inferencesh-cli-v1.17.23-darwin-amd64.tar.gz"
      sha256 "b10eeeb5c3dbf6252fdda64fc195474523a2664406f9a9f985c529337c0bc454"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.23/inferencesh-cli-v1.17.23-linux-arm64.tar.gz"
      sha256 "99c2db805acee5d088d5e1c1a242793f08500180cce9dbdcafdeeac928472d4b"
    else
      url "https://dist.inference.sh/cli/v1.17.23/inferencesh-cli-v1.17.23-linux-amd64.tar.gz"
      sha256 "478c094bff7bdd41ac599832d0006edb16e29e11caba8d2e2f17c2f5283869c9"
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
