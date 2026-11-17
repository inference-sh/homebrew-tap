class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.3/inferencesh-cli-v1.29.3-darwin-arm64.tar.gz"
      sha256 "b1208df3eb548805a84cbd046dc70028748626f252ddfc7ceb31165c8ac46c9f"
    else
      url "https://dist.inference.sh/cli/v1.29.3/inferencesh-cli-v1.29.3-darwin-amd64.tar.gz"
      sha256 "0b4c1ec42e5741d4c942f828f03cfc55a190539a1d6302d3fe59a13ceef5dbfb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.3/inferencesh-cli-v1.29.3-linux-arm64.tar.gz"
      sha256 "b97d48f4264dadf7437941878af7a20935c39069dc81217dc09c984cb38b8281"
    else
      url "https://dist.inference.sh/cli/v1.29.3/inferencesh-cli-v1.29.3-linux-amd64.tar.gz"
      sha256 "2ce7e1ed6a2aca519db4ebbb9db9f1a1f5d6acce76af9a753325d450f81b2877"
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
