class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.14.1-1-g1ecba90"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.1-1-g1ecba90-darwin-arm64.tar.gz"
      sha256 "101a15634cba1780defbe28dbf8b349978acfb36f2418314bb8df1a8571195b2"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.1-1-g1ecba90-darwin-amd64.tar.gz"
      sha256 "177c1174aef107be3359954cd2b3bf3491be17d4a9e3f695b1c81e3902467a52"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.1-1-g1ecba90-linux-arm64.tar.gz"
      sha256 "914d94d5c82664282554683979544de4ea2a75366e0440c8d481fbf3071324b0"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.1-1-g1ecba90-linux-amd64.tar.gz"
      sha256 "80eb4205f7a7772b8521879ef1123f6484c7f49d79754591e905ed3de00c7dab"
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
