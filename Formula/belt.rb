class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.7/inferencesh-cli-v1.15.7-darwin-arm64.tar.gz"
      sha256 "928f7d76fe8ff957b42c2a7209bbd5a8ea10a473486ddfb9134cf0ef30a59674"
    else
      url "https://dist.inference.sh/cli/v1.15.7/inferencesh-cli-v1.15.7-darwin-amd64.tar.gz"
      sha256 "bd916b9c6cf977cd5612fb87d47d50f477d8150394084facd51d195243ede3a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.7/inferencesh-cli-v1.15.7-linux-arm64.tar.gz"
      sha256 "dcd08c696fd9cfda04277b85eac2e6210b0bd40a7e037d52aaf125fe22c34b31"
    else
      url "https://dist.inference.sh/cli/v1.15.7/inferencesh-cli-v1.15.7-linux-amd64.tar.gz"
      sha256 "cafa4ff9ad4b1514cea702841edde82ed843240a252698d482c0ab89becb7516"
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
