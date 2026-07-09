class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.14.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.17/inferencesh-cli-v1.14.17-darwin-arm64.tar.gz"
      sha256 "61643d2e9aec9dc4cee8bc282a5fe251ad3790e7b6e2ec7096a65301559f58ee"
    else
      url "https://dist.inference.sh/cli/v1.14.17/inferencesh-cli-v1.14.17-darwin-amd64.tar.gz"
      sha256 "3c099491b36191c2afb279f276ba9f08a2374466e140a3ded2206f27dca3483c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.17/inferencesh-cli-v1.14.17-linux-arm64.tar.gz"
      sha256 "6198c857bea6899ec55c8406f70dd23c0bb9626b71fe3e5b9fa36bee6f75457e"
    else
      url "https://dist.inference.sh/cli/v1.14.17/inferencesh-cli-v1.14.17-linux-amd64.tar.gz"
      sha256 "1653bb1e678f833db3f25ecf2b18b8974540f9f4663587b91c8a0c0929fe085c"
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
