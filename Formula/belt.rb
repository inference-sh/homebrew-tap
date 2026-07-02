class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.14.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.7-darwin-arm64.tar.gz"
      sha256 "3a6205b876de0383af0a7a30c543118cce1ac206a36b435597522613fb9c0da8"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.7-darwin-amd64.tar.gz"
      sha256 "d95c758ac48395ea63a917d0226f2ef6bfc862828123ec23164bc8648b3db15a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.7-linux-arm64.tar.gz"
      sha256 "0b1ed480d2cb25a1296dd14ee38be1120b39af5f4db76723db57f3979071e54c"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.7-linux-amd64.tar.gz"
      sha256 "408768cfe9104e3316f3fcd61d9b3c402975bf71233a81f0610e8f1ae72a50a2"
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
