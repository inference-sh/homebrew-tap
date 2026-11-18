class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.7/inferencesh-cli-v1.29.7-darwin-arm64.tar.gz"
      sha256 "df03473fd0c24a603ccad9e42b3b77b0ee68a136418d1bedd937297f2d11e484"
    else
      url "https://dist.inference.sh/cli/v1.29.7/inferencesh-cli-v1.29.7-darwin-amd64.tar.gz"
      sha256 "b8dfe3084422e8c8764d1f91c09ef9d9b76b02a6ffd04c2af39b22a9c8cfaf00"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.7/inferencesh-cli-v1.29.7-linux-arm64.tar.gz"
      sha256 "793e642f2d418338bbf7d046999774fc12c1d8c9548d4928ad0496fb52ea539e"
    else
      url "https://dist.inference.sh/cli/v1.29.7/inferencesh-cli-v1.29.7-linux-amd64.tar.gz"
      sha256 "419dba11736b81ec5d66d63d5c981fbf845349fee1f1c9316704e24bf767dcc6"
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
