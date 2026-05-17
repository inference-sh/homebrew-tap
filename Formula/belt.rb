class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.12-darwin-arm64.tar.gz"
      sha256 "6a916b96a35e0462195795afc7d3b7c2391edf213e85dd7dbfad54995793c9ef"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.12-darwin-amd64.tar.gz"
      sha256 "cb89fd140e7aa237f56c3601853e18761ccbd49d4424847aebaad34745c40bb8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.12-linux-arm64.tar.gz"
      sha256 "0e1757756ec7778aca20ef6fb88ea1eec8051feb2aecb6e4cd023c2fedc21719"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.12-linux-amd64.tar.gz"
      sha256 "874027d0779fac68dd43869a7eb2e158b85ce4828f3a9ee54697f0938da34f4d"
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
