class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.24/inferencesh-cli-v1.15.24-darwin-arm64.tar.gz"
      sha256 "d51fe00f61ba391592c7d4bcac23d437a826b5f662d08d6bc4a2c310734d36e5"
    else
      url "https://dist.inference.sh/cli/v1.15.24/inferencesh-cli-v1.15.24-darwin-amd64.tar.gz"
      sha256 "0b2b1ba4890ae3d910c79a30edd5f7734e203547caf60fdb287969e15c8882d1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.24/inferencesh-cli-v1.15.24-linux-arm64.tar.gz"
      sha256 "6d3d66ea582381573f061f51c4b1096bb8decf9a818847180a5551194fa117d8"
    else
      url "https://dist.inference.sh/cli/v1.15.24/inferencesh-cli-v1.15.24-linux-amd64.tar.gz"
      sha256 "2cbcd36663a966ea3a3a903f30d76fc51182e3dffbb6abd7ffbb7da52168180b"
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
