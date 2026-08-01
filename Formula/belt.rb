class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.14/inferencesh-cli-v1.16.14-darwin-arm64.tar.gz"
      sha256 "19d9b9232e7dd2818d2e9c0887cf89f8457dd152b48ccc3bb7659d1dfd6bf0e8"
    else
      url "https://dist.inference.sh/cli/v1.16.14/inferencesh-cli-v1.16.14-darwin-amd64.tar.gz"
      sha256 "ef24661ae825bcc8ada9c59acd4d34ad172970d3be104d0158b0795de6265d5e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.14/inferencesh-cli-v1.16.14-linux-arm64.tar.gz"
      sha256 "bc4f9c218ee83eb9253855ae01b825e40472f5977f0ab7b733f2a7010bcf10b2"
    else
      url "https://dist.inference.sh/cli/v1.16.14/inferencesh-cli-v1.16.14-linux-amd64.tar.gz"
      sha256 "e44d9c3afbc5714ead63ed437f89f349f2f440df7d21437aaef5135757e52cdf"
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
