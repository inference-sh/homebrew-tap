class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.0-darwin-arm64.tar.gz"
      sha256 "c086453dcbcb04b686dd356c80775ad51c707a9e2856ab6d5db02035d66a537a"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.0-darwin-amd64.tar.gz"
      sha256 "2869ed63ce749d2934d1b289fc2f8d794f90833a7f4cb52048ef37177e5e361e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.0-linux-arm64.tar.gz"
      sha256 "a2ac2efd625d7cd57eba2684c083ce57e42a456819e4ca7e545f20a7d6afc10e"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.0-linux-amd64.tar.gz"
      sha256 "17945eee33ced5f6515a7329b5257a4b77f2763e99f715211db948126813a010"
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
