class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.2-darwin-arm64.tar.gz"
      sha256 "7bb4dc6c9e14acdc347fe6f1f62724e5ff98a5466eaba0fbdf225801f852af28"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.2-darwin-amd64.tar.gz"
      sha256 "3a74943641cb86c4f68221d78b24a423566b0eb365c435f80777fbb8fa3bf8f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.2-linux-arm64.tar.gz"
      sha256 "6c9db4f2836696ccb6d0a0143ee17502accb9b7e55efbd44481a84b2bf1feaf2"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.2-linux-amd64.tar.gz"
      sha256 "7a7d83d65162633581d56de219f649a348c4bbd9b3f2531d214692adc2ad532f"
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
