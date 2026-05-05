class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.8-darwin-arm64.tar.gz"
      sha256 "6a8c7c46bd35ef04c0dd14e57023482855b5d972505d4b46196291fd6e893dfc"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.8-darwin-amd64.tar.gz"
      sha256 "c6851780a8ea834e292894f3d36a93a27c1e6f73e39669ce7ffd93b8133adcfd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.8-linux-arm64.tar.gz"
      sha256 "382b28e9ce1d60b96adacd76d92a4c55f27cba527aeefa7620a0a483d369a8bf"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.8-linux-amd64.tar.gz"
      sha256 "df5cb10d85bd4357ff833c548ecec89aee03316d40b4ef0a27afece333a890c7"
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
