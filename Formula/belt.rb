class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.7/inferencesh-cli-v1.28.7-darwin-arm64.tar.gz"
      sha256 "52d2f8b2c2a02ef9e3963dfb06b0b524483bcdd27c1d35fd2ed96c043b67a540"
    else
      url "https://dist.inference.sh/cli/v1.28.7/inferencesh-cli-v1.28.7-darwin-amd64.tar.gz"
      sha256 "ce1629200231e8b7e9310ded29f1b79a80807bf09bf7652ee4e491931ba35f2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.7/inferencesh-cli-v1.28.7-linux-arm64.tar.gz"
      sha256 "cae56d7152fc0a9a220c600dabd86cca642c57fb923df7644e8248694126d59f"
    else
      url "https://dist.inference.sh/cli/v1.28.7/inferencesh-cli-v1.28.7-linux-amd64.tar.gz"
      sha256 "ef8c6061de3d02c07c589c740a7f8518d6ddb4482e5cba4f55192c7af2159854"
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
