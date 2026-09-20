class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.45"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.45/inferencesh-cli-v1.18.45-darwin-arm64.tar.gz"
      sha256 "e489a56032204a524e63948b2b52c1dfd673b546037164fe04f0b91d50552457"
    else
      url "https://dist.inference.sh/cli/v1.18.45/inferencesh-cli-v1.18.45-darwin-amd64.tar.gz"
      sha256 "4fe9ddab7970d803c75b0b1ae83d0207a89df3068ea47a94c0d64231e93ea9a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.45/inferencesh-cli-v1.18.45-linux-arm64.tar.gz"
      sha256 "fa39beecd8484e1a7b7d4d2bb8f430990cf0e97169d460598d1fea292bf56ac6"
    else
      url "https://dist.inference.sh/cli/v1.18.45/inferencesh-cli-v1.18.45-linux-amd64.tar.gz"
      sha256 "941f9bc823a70da2f910570d5a09174a15279341646ade47bd79b2c21f78e32a"
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
