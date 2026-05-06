class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.12-darwin-arm64.tar.gz"
      sha256 "2262a684140076557463d31bb2067565a83729aca3d823ca38649652d0730579"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.12-darwin-amd64.tar.gz"
      sha256 "658c97a481af69f349db95ae9c35e67c234ac08eb736bf62fbd4491294600cbf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.12-linux-arm64.tar.gz"
      sha256 "845fc5f58d3de198f50240b7b9083737fd85ce2d1122b7192ddfabac886a9203"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.12-linux-amd64.tar.gz"
      sha256 "7a53336db4eb3f06995a40d5be50704e8a70a9993937c7a08eee0f0fcc30308a"
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
