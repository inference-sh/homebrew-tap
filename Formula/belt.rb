class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.48"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.48/inferencesh-cli-v1.18.48-darwin-arm64.tar.gz"
      sha256 "31f24c66d09e74f2430f15965e3f96e0e92b75d628e595fb75d1632eb3f6cedb"
    else
      url "https://dist.inference.sh/cli/v1.18.48/inferencesh-cli-v1.18.48-darwin-amd64.tar.gz"
      sha256 "fce43954bf1ef09d88a73188c57389a73c855900b0846ecd1e3689b3055384fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.48/inferencesh-cli-v1.18.48-linux-arm64.tar.gz"
      sha256 "23b7892ee34f705c0c373e9fba2f2f626c6deb0bfbf69e4d8dd112a381fee660"
    else
      url "https://dist.inference.sh/cli/v1.18.48/inferencesh-cli-v1.18.48-linux-amd64.tar.gz"
      sha256 "34e8870faa78f03525883be89ea0bfd9cb1bb3012a1cd81d9d5274881072f322"
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
