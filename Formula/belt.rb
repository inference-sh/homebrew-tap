class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.10.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.2-darwin-arm64.tar.gz"
      sha256 "6f791b250a5799887d26cbe01fbeec224ddb9a9dfa908cb666f88034ee2c4e9f"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.2-darwin-amd64.tar.gz"
      sha256 "55ac8104a62f07a1c4f6d49a2a2511568d0d49dbf0aef4a8edbc82d8379c1d82"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.2-linux-arm64.tar.gz"
      sha256 "b4e21229cc7fa2a30146f6003da81caf218a2504cc2bf54fc66ee6a59e008fbc"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.2-linux-amd64.tar.gz"
      sha256 "dfbfbaf0aba677b006b5604b50b0784f0fb8d19bd4a98093432d0c31b1cd6f54"
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
