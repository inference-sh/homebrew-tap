class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.61"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.61/inferencesh-cli-v1.18.61-darwin-arm64.tar.gz"
      sha256 "61f9d8b4eca6dd38fb50c9c214c8926ae53667701eb9147c3d2ec5b52a02dc3c"
    else
      url "https://dist.inference.sh/cli/v1.18.61/inferencesh-cli-v1.18.61-darwin-amd64.tar.gz"
      sha256 "cef0adfc9eb71a2d72fdd8828c8698fa36b77194d945744144f4a2d9afa83587"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.61/inferencesh-cli-v1.18.61-linux-arm64.tar.gz"
      sha256 "22e988a08cc4785ec41de1e73c211d35202df0b99ec371c40d095e3b1d621cc1"
    else
      url "https://dist.inference.sh/cli/v1.18.61/inferencesh-cli-v1.18.61-linux-amd64.tar.gz"
      sha256 "ed3c54821e8329b057b11f5668455f36a598efededbec50ba5747972b890ed16"
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
