class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.0/inferencesh-cli-v1.16.0-darwin-arm64.tar.gz"
      sha256 "57cf4c634fa1ccb87f1d6641c5a365fae2bf065f9762820687eba22e5179f877"
    else
      url "https://dist.inference.sh/cli/v1.16.0/inferencesh-cli-v1.16.0-darwin-amd64.tar.gz"
      sha256 "1a4e96733ec89ef1b51c3be3f97e75fa76bce1db0c0f4e8c48f37742bf1a2603"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.0/inferencesh-cli-v1.16.0-linux-arm64.tar.gz"
      sha256 "dd19c2525680c67f3acde17cc82be1b67f633d34d6082f7fed4d4bd6adf0e407"
    else
      url "https://dist.inference.sh/cli/v1.16.0/inferencesh-cli-v1.16.0-linux-amd64.tar.gz"
      sha256 "cd744131dc578c874b1f57075050ba93e0adc7ff0a3bbc12e548028885ff11f7"
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
