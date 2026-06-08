class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.31-darwin-arm64.tar.gz"
      sha256 "cf97111050cc7ce9762637d75863eeacf17b69e7a927880cfed85b758d35f194"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.31-darwin-amd64.tar.gz"
      sha256 "66911a8adca7cb42914bfd7aa362499fdd9ee36fc17182a5b610cd6ddc224d36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.31-linux-arm64.tar.gz"
      sha256 "9a62842d27b304ffcae19a3b9c943036c21c7c8019a24080ba2066cca72ab1a9"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.31-linux-amd64.tar.gz"
      sha256 "34681a6d03e8fab559f0f84a1d787a06364e6832e3ab95836918e0defbb10789"
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
