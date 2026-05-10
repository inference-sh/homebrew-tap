class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.4-darwin-arm64.tar.gz"
      sha256 "0d8305520bd3f0262c349e17b0fc87e2c90700149960e463fb41d92d1782f676"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.4-darwin-amd64.tar.gz"
      sha256 "0823c48e8c83519b0f69ee989a20936d2a019b033f78101602e10b2c43ef1648"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.4-linux-arm64.tar.gz"
      sha256 "3569e008d9de0ba8b63df3fe1ba690e0963a4983ed3bad144c85d86748ded286"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.4-linux-amd64.tar.gz"
      sha256 "c030548a4ad4e84cdd406271a243cf2ee6a14995f2921a36b09da44b6f0670cd"
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
