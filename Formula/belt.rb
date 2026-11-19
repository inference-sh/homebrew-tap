class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.8/inferencesh-cli-v1.29.8-darwin-arm64.tar.gz"
      sha256 "f9f3510f320496207cb42e0540005de13fce9dfd3f459e5d3571ab268a9a6a7f"
    else
      url "https://dist.inference.sh/cli/v1.29.8/inferencesh-cli-v1.29.8-darwin-amd64.tar.gz"
      sha256 "ace2e8ffaf3139ff2fa6822a467248f427dbd4584004a1e5dac46ca55f2cea34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.8/inferencesh-cli-v1.29.8-linux-arm64.tar.gz"
      sha256 "9fd2f20f201c7f2e76049720a4ad5a7f30029a743f329b1f633d20397de9adaf"
    else
      url "https://dist.inference.sh/cli/v1.29.8/inferencesh-cli-v1.29.8-linux-amd64.tar.gz"
      sha256 "802fe8104f00aab7d108d0aa4c25cc05cd13f33fa377c447566c25f7550ab455"
    end
  end

  def install
    binary = Dir["inferencesh-cli-*"].first
    bin.install binary => "belt"
    bin.install_symlink "belt" => "infsh"
    bin.install_symlink "belt" => "inferencesh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/belt version")
  end
end
