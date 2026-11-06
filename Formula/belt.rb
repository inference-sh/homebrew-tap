class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.17/inferencesh-cli-v1.28.17-darwin-arm64.tar.gz"
      sha256 "9e62e8ea92bee898c1da14b3bf21a1c2cc95a88e3ea20d942ac04ae547e33fa8"
    else
      url "https://dist.inference.sh/cli/v1.28.17/inferencesh-cli-v1.28.17-darwin-amd64.tar.gz"
      sha256 "87bf006969b6dd44f5e7491e2ae53273a267397837393c1b5b7a9c5f741a94b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.17/inferencesh-cli-v1.28.17-linux-arm64.tar.gz"
      sha256 "6ec91d00c439190384dac12d4920ea20aba1d46c82057ba3f6b27dd0b0dbd66d"
    else
      url "https://dist.inference.sh/cli/v1.28.17/inferencesh-cli-v1.28.17-linux-amd64.tar.gz"
      sha256 "4ca1f67cf60b57a756dc8faa77c23093fffd5caa6f01f3014b1e0459bf4eda52"
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
