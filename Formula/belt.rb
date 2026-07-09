class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.14.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.16/inferencesh-cli-v1.14.16-darwin-arm64.tar.gz"
      sha256 "2ba3baedc6e88622ff6f06ad6849efc71f93305c9e003c92d3ab6bf9cb5b9428"
    else
      url "https://dist.inference.sh/cli/v1.14.16/inferencesh-cli-v1.14.16-darwin-amd64.tar.gz"
      sha256 "cb337abfb63e7521285dc1fe49f2a8019685032b852b50b66d996fd581922bd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.16/inferencesh-cli-v1.14.16-linux-arm64.tar.gz"
      sha256 "43b95f570c6de5a6c508b3fbc4f807735eb1ebeffdab904a2435e9d2d22debba"
    else
      url "https://dist.inference.sh/cli/v1.14.16/inferencesh-cli-v1.14.16-linux-amd64.tar.gz"
      sha256 "e197b991a26d1ea63ad85b1bae0b95d2de8e978446c8b957dae01c0f2fc3dc77"
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
