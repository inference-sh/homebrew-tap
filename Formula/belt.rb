class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.10/inferencesh-cli-v1.16.10-darwin-arm64.tar.gz"
      sha256 "e7c685f2777805ff08637ff989456330a6325e1502780466ba731bff04e86ec7"
    else
      url "https://dist.inference.sh/cli/v1.16.10/inferencesh-cli-v1.16.10-darwin-amd64.tar.gz"
      sha256 "d84ba8dfc6a3b937e79a48c23ee7136bf0c72a0a5054705824e4947694f57d20"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.10/inferencesh-cli-v1.16.10-linux-arm64.tar.gz"
      sha256 "f59a8516fb2bf09136322efc936c0e5c97e2b837d547296bcaf3febd4ac28fc2"
    else
      url "https://dist.inference.sh/cli/v1.16.10/inferencesh-cli-v1.16.10-linux-amd64.tar.gz"
      sha256 "611cc9ec7e533121539f62a78c386d15330753a68684193999137764b03a8319"
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
