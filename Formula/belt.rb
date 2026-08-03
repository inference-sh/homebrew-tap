class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.22/inferencesh-cli-v1.16.22-darwin-arm64.tar.gz"
      sha256 "1b558e53295ac68f935500a7ca54cfae19b358cb97c91f01a6fd316da62053f5"
    else
      url "https://dist.inference.sh/cli/v1.16.22/inferencesh-cli-v1.16.22-darwin-amd64.tar.gz"
      sha256 "ff6ac9762d9d8cacdc8d750ef813265c8f0ee7517f168626ae72567d3d1da56e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.22/inferencesh-cli-v1.16.22-linux-arm64.tar.gz"
      sha256 "fff2a27137790114103895f62002bb5f78ab8855b860dad1ffc818de8f9c1989"
    else
      url "https://dist.inference.sh/cli/v1.16.22/inferencesh-cli-v1.16.22-linux-amd64.tar.gz"
      sha256 "7f45f7630bc42f824eb7a1786db15674dbb0053306224c8715c0c028681ebacd"
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
