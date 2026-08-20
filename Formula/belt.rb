class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.30/inferencesh-cli-v1.17.30-darwin-arm64.tar.gz"
      sha256 "8af6b588d8651ec7fedec50bd5650e4cebfa28be794fbfec7c82da0974c5381f"
    else
      url "https://dist.inference.sh/cli/v1.17.30/inferencesh-cli-v1.17.30-darwin-amd64.tar.gz"
      sha256 "3d501c7687fdedfefc99fd05335326053a1fbc449971a4208e63af328df7d8e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.30/inferencesh-cli-v1.17.30-linux-arm64.tar.gz"
      sha256 "4bf033132894399c8a58de40e98a4e90a0c70c167b7e5d17e9eb8950cb27b1ee"
    else
      url "https://dist.inference.sh/cli/v1.17.30/inferencesh-cli-v1.17.30-linux-amd64.tar.gz"
      sha256 "d679c2644e9e23b7ec982b55c8303e2a2b940970639ba16a205140c19be22199"
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
