class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.15-darwin-arm64.tar.gz"
      sha256 "c4de5950c47a0d8882389efa9c2599b46e8131905d143f1708b4a3a57c77f0ff"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.15-darwin-amd64.tar.gz"
      sha256 "2fac9f90c92bb00ba9b5a0fdaee94779bc864bffb63ed7822a84cbc0f721f925"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.15-linux-arm64.tar.gz"
      sha256 "b0e80e643c87b40765985fdace496d28d4ca27259490bb559e40f239bbe48dc4"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.15-linux-amd64.tar.gz"
      sha256 "974c60a13d2e510c2801b847a461bb1188fb9ee2ae987b59fa60dc075e651b1f"
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
