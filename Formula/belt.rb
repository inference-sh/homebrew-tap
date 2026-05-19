class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.31-darwin-arm64.tar.gz"
      sha256 "acc0aa63e757f209964c2d5b5bb6c52bb3877364062e502ef517e712eafc3992"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.31-darwin-amd64.tar.gz"
      sha256 "f0e4a07aa2f83323bf637f9f2dd13ed3f9364f54571aa647e90ed3f8e5040276"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.31-linux-arm64.tar.gz"
      sha256 "b3effe4db9c527271cc9320035bc646cfa88a6418d8f71c4e0d6ede9fa229ca6"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.31-linux-amd64.tar.gz"
      sha256 "7be6804ab05169137246f3e84ceb71790221d2e247cd8c2b4abce56e9fb439f6"
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
