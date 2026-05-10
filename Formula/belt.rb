class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.3-darwin-arm64.tar.gz"
      sha256 "dce8866c4fd290906b26134ec78f86c23bc901b27376fc26066a1843c57e61bf"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.3-darwin-amd64.tar.gz"
      sha256 "0d61c34dd07f63a760d9dcf8445ab6fa02e3445ae47dce34147deb0ab8dc565d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.3-linux-arm64.tar.gz"
      sha256 "087481cb222d3c2e9667830d5e17b6444a4a2a83b95e15194364279e39194d4f"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.3-linux-amd64.tar.gz"
      sha256 "9288a78a51617889c6581ea67186de1fa60d6bf3bd428aeee4acc89f26215405"
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
