class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.9/inferencesh-cli-v1.29.9-darwin-arm64.tar.gz"
      sha256 "540644bd4501d1a03f85a1adb0f71299d6c247abb8e6a9feaa4b255c0b0e7ae5"
    else
      url "https://dist.inference.sh/cli/v1.29.9/inferencesh-cli-v1.29.9-darwin-amd64.tar.gz"
      sha256 "1bddc58b0c8a02e41311c444d8fc0042ee37cb63e41e4c6fa77ac2ab42e60d6f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.9/inferencesh-cli-v1.29.9-linux-arm64.tar.gz"
      sha256 "b83bfa8ccaa4b0a9bd237598ecfe1223c2668829c3a52ad52d315994781e5506"
    else
      url "https://dist.inference.sh/cli/v1.29.9/inferencesh-cli-v1.29.9-linux-amd64.tar.gz"
      sha256 "ad2cebd31496d7cdedef22028a8111f07613ebb56368c17d166735bb837a78d5"
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
