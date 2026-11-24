class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.10/inferencesh-cli-v1.29.10-darwin-arm64.tar.gz"
      sha256 "d69dc5ba907d432e37d5d7d009eccb55b23cba82dc79d58a9375c3dfe88e5739"
    else
      url "https://dist.inference.sh/cli/v1.29.10/inferencesh-cli-v1.29.10-darwin-amd64.tar.gz"
      sha256 "05164dca94d8872fbbc369849f644cb46aca6038ecaed705403fef674278ebe3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.10/inferencesh-cli-v1.29.10-linux-arm64.tar.gz"
      sha256 "ccc98c56fc658561317d9aba890ed112de0c6775ffc98744fedb622c842e03da"
    else
      url "https://dist.inference.sh/cli/v1.29.10/inferencesh-cli-v1.29.10-linux-amd64.tar.gz"
      sha256 "6e69b9dacd5dce862b9173e1e4902cf2a7e82036eef99d8447a6cb2551706eda"
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
