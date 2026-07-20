class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.19/inferencesh-cli-v1.15.19-darwin-arm64.tar.gz"
      sha256 "9b2540ff59896b5ae2c8f303349c3bbc321681bb8fbbc38491ab7e3cb6531ad9"
    else
      url "https://dist.inference.sh/cli/v1.15.19/inferencesh-cli-v1.15.19-darwin-amd64.tar.gz"
      sha256 "5869fdc0a1c6aad3013a361f176f23c1a4548d5b0fa02c5ee331d8d3861a4497"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.19/inferencesh-cli-v1.15.19-linux-arm64.tar.gz"
      sha256 "8410538764514b5032f0c18aa52d3f70006efd7712329cc84abc01337961d9e2"
    else
      url "https://dist.inference.sh/cli/v1.15.19/inferencesh-cli-v1.15.19-linux-amd64.tar.gz"
      sha256 "f67738e1bdaf14ed82625006e773d40bfcd79cbc95820d74a035d21af2c751c3"
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
