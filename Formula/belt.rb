class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.5/inferencesh-cli-v1.28.5-darwin-arm64.tar.gz"
      sha256 "4d9adb37fef92e4aca61e0e58a0cc0d775269e592825cd779a2a09f87806a43f"
    else
      url "https://dist.inference.sh/cli/v1.28.5/inferencesh-cli-v1.28.5-darwin-amd64.tar.gz"
      sha256 "762b031dbee8b52331b681246515b46abcd24321f06c1043db4843361b15110e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.5/inferencesh-cli-v1.28.5-linux-arm64.tar.gz"
      sha256 "3c29d288181970d8a3746b708b2e034c3673b1949addf39081b946bc1d469b4f"
    else
      url "https://dist.inference.sh/cli/v1.28.5/inferencesh-cli-v1.28.5-linux-amd64.tar.gz"
      sha256 "c4c1351a16b9b0b36ba837703c7d93ad52df066269fa7d316d6b7a5aa40e04c0"
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
