class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.25/inferencesh-cli-v1.28.25-darwin-arm64.tar.gz"
      sha256 "d82cccea979b42feb5a5793e6c1a71db1c49a8d13191f8e18bead5c1de8be39e"
    else
      url "https://dist.inference.sh/cli/v1.28.25/inferencesh-cli-v1.28.25-darwin-amd64.tar.gz"
      sha256 "c0450b8f01426d7daeb70964aca37091db6420f6cf559e4149462823d1141c0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.25/inferencesh-cli-v1.28.25-linux-arm64.tar.gz"
      sha256 "cb2873b85969b3d5ebdcca2f23eeebdc3dd1df9ed0270333bcbbc948fecea472"
    else
      url "https://dist.inference.sh/cli/v1.28.25/inferencesh-cli-v1.28.25-linux-amd64.tar.gz"
      sha256 "fbb2c083e5967abd5141a34d10cdbe4be1ea7640a60944f23ddda9bb862e1088"
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
