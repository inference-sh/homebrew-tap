class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.41"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.41/inferencesh-cli-v1.18.41-darwin-arm64.tar.gz"
      sha256 "ea7aa5673ac361d0bde0edf20864bef6e471c24728a95189badafdf896bb8440"
    else
      url "https://dist.inference.sh/cli/v1.18.41/inferencesh-cli-v1.18.41-darwin-amd64.tar.gz"
      sha256 "9ab72cd5154e01c5d6d2aa1e6c30a17abbe0cceff7cad1b120811ebee12d8cab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.41/inferencesh-cli-v1.18.41-linux-arm64.tar.gz"
      sha256 "97960b285884f4dcbc96bd25f7c3f054b11faafd439b09923dc92d2e053d7551"
    else
      url "https://dist.inference.sh/cli/v1.18.41/inferencesh-cli-v1.18.41-linux-amd64.tar.gz"
      sha256 "be187fd15cfb2e75481ddb3e9affb66ac60916a4e35b136b13f119978522f0fd"
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
