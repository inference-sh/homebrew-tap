class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.11/inferencesh-cli-v1.28.11-darwin-arm64.tar.gz"
      sha256 "000035a3fca9dca5b89372007f3bedd20304cdf6c64337a7985f160394496993"
    else
      url "https://dist.inference.sh/cli/v1.28.11/inferencesh-cli-v1.28.11-darwin-amd64.tar.gz"
      sha256 "5d6561da4a4683d209c558114e1c4a7039332396fe8fb37bd0d9ed271e63e06d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.11/inferencesh-cli-v1.28.11-linux-arm64.tar.gz"
      sha256 "440a36c07158a9852359c635ed7fae6d066758484e83bc65a02f4022b0346d91"
    else
      url "https://dist.inference.sh/cli/v1.28.11/inferencesh-cli-v1.28.11-linux-amd64.tar.gz"
      sha256 "9fcfd1bccbe00b4293d4cb9b1b979bab431feaa58e395deef5f7bccbd6988c9c"
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
