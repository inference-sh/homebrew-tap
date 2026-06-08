class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.27-darwin-arm64.tar.gz"
      sha256 "fa81c3eb2aea49dd7292365dfa3fb3a76538376a274fd29353629f6b9f04c917"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.27-darwin-amd64.tar.gz"
      sha256 "305fa4cd97af973211e4fb7ccc90b113b8aead286e46a3e98560bd1dac155dd6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.27-linux-arm64.tar.gz"
      sha256 "2bea1b6892cc16a1049665b576baf0d3554baa4767525f5485e257b1f85a3e61"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.27-linux-amd64.tar.gz"
      sha256 "ef5cf3f6750ab7e3841e302a6a54439d209172e718d6306eb3e4e9de9dafb6cb"
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
