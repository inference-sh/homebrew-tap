class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.19/inferencesh-cli-v1.16.19-darwin-arm64.tar.gz"
      sha256 "d49ee169f180071dd8533a061394c7583d1f8728abba585c05761116bfc06112"
    else
      url "https://dist.inference.sh/cli/v1.16.19/inferencesh-cli-v1.16.19-darwin-amd64.tar.gz"
      sha256 "73f02295e861445db2406d18f7ea4a9386236041ce906c0687f8d44057477ae7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.19/inferencesh-cli-v1.16.19-linux-arm64.tar.gz"
      sha256 "802d11e3d43e21bd90e85cb7db43407fa8780b934329a8aa978c3952f7323685"
    else
      url "https://dist.inference.sh/cli/v1.16.19/inferencesh-cli-v1.16.19-linux-amd64.tar.gz"
      sha256 "f237395b39a08bffe3690c7485529802a99affab0adc8173f54fcdf794c21c52"
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
