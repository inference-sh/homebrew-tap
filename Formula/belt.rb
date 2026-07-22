class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.26/inferencesh-cli-v1.15.26-darwin-arm64.tar.gz"
      sha256 "8183d3b0a5225616cd44439e4939a499c317e3c9dd4827c87dabada7e2117935"
    else
      url "https://dist.inference.sh/cli/v1.15.26/inferencesh-cli-v1.15.26-darwin-amd64.tar.gz"
      sha256 "03bfeb62c19d06f7422b54889b585c94ca3beaa14c17cb9490f69e942477d5d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.26/inferencesh-cli-v1.15.26-linux-arm64.tar.gz"
      sha256 "6776716eb23813202b1b147c2174271295751d54e70da13f41db5326e2ee404c"
    else
      url "https://dist.inference.sh/cli/v1.15.26/inferencesh-cli-v1.15.26-linux-amd64.tar.gz"
      sha256 "7b613c755e18494ca9bb9ade47bebb35f401dc4169c3eba699adb4e10dcc3a3a"
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
