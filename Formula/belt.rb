class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.6-5-g9df7902"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.6-5-g9df7902/inferencesh-cli-v1.18.6-5-g9df7902-darwin-arm64.tar.gz"
      sha256 "f2bc9aa830cc4b37afe9bc467914abb699164a46d7eeb53a8d3405c552a1b582"
    else
      url "https://dist.inference.sh/cli/v1.18.6-5-g9df7902/inferencesh-cli-v1.18.6-5-g9df7902-darwin-amd64.tar.gz"
      sha256 "4fa2624f5d654bc292495f0c2213c6f82e7bc15d6f6db8420cefb356b7137e20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.6-5-g9df7902/inferencesh-cli-v1.18.6-5-g9df7902-linux-arm64.tar.gz"
      sha256 "225253a4a1ad78822a678ea33290690c79168fc5a4856b042ec9ea71c8acb95b"
    else
      url "https://dist.inference.sh/cli/v1.18.6-5-g9df7902/inferencesh-cli-v1.18.6-5-g9df7902-linux-amd64.tar.gz"
      sha256 "6f537e23b033bab68c91a2fabe4b7b9f8b2c9d75699e6f9f38900152367362b0"
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
