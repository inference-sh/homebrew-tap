class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.56"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.56/inferencesh-cli-v1.18.56-darwin-arm64.tar.gz"
      sha256 "35612394f099bb6772855e8eee7472d962c58aa9c27e298091afd61f1944dfec"
    else
      url "https://dist.inference.sh/cli/v1.18.56/inferencesh-cli-v1.18.56-darwin-amd64.tar.gz"
      sha256 "ce7d9ac6d595a04be8c3388611d7ff60aaf0a5723ea2afe43ff437bf716ce465"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.56/inferencesh-cli-v1.18.56-linux-arm64.tar.gz"
      sha256 "8d866f2d6ffaa668a462eff034f04a17b652abe97fb5fb815344d96582caab15"
    else
      url "https://dist.inference.sh/cli/v1.18.56/inferencesh-cli-v1.18.56-linux-amd64.tar.gz"
      sha256 "95afe226686f1e4d33ee05b2c920a527eb80f551beba90a3da5dbfd1b9c7d4ee"
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
