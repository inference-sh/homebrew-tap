class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.6/inferencesh-cli-v1.29.6-darwin-arm64.tar.gz"
      sha256 "c02e65d360feec946fbfa1609f94f65bac44e584f4440109990ef2316aa9e311"
    else
      url "https://dist.inference.sh/cli/v1.29.6/inferencesh-cli-v1.29.6-darwin-amd64.tar.gz"
      sha256 "efb472ee112da07d5074743ad97b366f8e56d660e190a44f333458c3521510dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.6/inferencesh-cli-v1.29.6-linux-arm64.tar.gz"
      sha256 "3682bd7eeb386d70a5d5e37eb57a13d8fa60bfeacd81f79cd4d5c7f2e732f65e"
    else
      url "https://dist.inference.sh/cli/v1.29.6/inferencesh-cli-v1.29.6-linux-amd64.tar.gz"
      sha256 "6f2f5986017454d0726d55aeb9d4467a2a931f05f12e980b0f87faf38d3705cb"
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
