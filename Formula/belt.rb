class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.7-darwin-arm64.tar.gz"
      sha256 "2fe821b7efc1a9d10d2ab41dfdcf8b1733a688be81da149474e37815ce3f7e06"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.7-darwin-amd64.tar.gz"
      sha256 "3d1dbe8687c6c33eddfff6f17b7313a9c76de1c6052392be72c9ca6339be69cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.7-linux-arm64.tar.gz"
      sha256 "cb0653bf5d25796456220a9e4aed5502aa14c588258f7189778ec9d4bf4af63e"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.7-linux-amd64.tar.gz"
      sha256 "09cff49e5ad42a501744e35ae8569c9e91ee452f27c09651bde9d92293e2478a"
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
