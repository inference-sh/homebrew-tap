class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.32/inferencesh-cli-v1.18.32-darwin-arm64.tar.gz"
      sha256 "e92af814d35c88c9ab30ab1dbb87df1d6638c79d2aeacdb858b70a7b86bca045"
    else
      url "https://dist.inference.sh/cli/v1.18.32/inferencesh-cli-v1.18.32-darwin-amd64.tar.gz"
      sha256 "90d71059b3289731b8013389edfcf9d4be68b8c93d5758b823606f71337d7b7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.32/inferencesh-cli-v1.18.32-linux-arm64.tar.gz"
      sha256 "f7bac5768f7a6dafba3dae9534583c3553b9746af8a181ce175d8bafb9912bb6"
    else
      url "https://dist.inference.sh/cli/v1.18.32/inferencesh-cli-v1.18.32-linux-amd64.tar.gz"
      sha256 "36ca74ee3a70cb9d1163b8451c1353ac61260746110be970cee1563b31432ebc"
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
