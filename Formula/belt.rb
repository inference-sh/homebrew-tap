class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.4/inferencesh-cli-v1.15.4-darwin-arm64.tar.gz"
      sha256 "1dde7d7e34f4818b157bb487324081f1a5016408b0ba00490aebc8b9874b9d68"
    else
      url "https://dist.inference.sh/cli/v1.15.4/inferencesh-cli-v1.15.4-darwin-amd64.tar.gz"
      sha256 "d94679356a1c319989dd947d62c941ea981dcd858a94073ffe8c4de473e2225c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.4/inferencesh-cli-v1.15.4-linux-arm64.tar.gz"
      sha256 "2a6eff0c367e854ede1c2dace0fe97f46ab281fa5e515f1054d1e8a2174ebb45"
    else
      url "https://dist.inference.sh/cli/v1.15.4/inferencesh-cli-v1.15.4-linux-amd64.tar.gz"
      sha256 "b0dc2fb9bf378d0328e594ac744fd269606455f814ac8dd00109554ea6a0a0ea"
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
