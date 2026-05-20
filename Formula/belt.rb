class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.36"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.36-darwin-arm64.tar.gz"
      sha256 "3f260a16f79b754c2c6940f5b52209f9d345839e21506a8584259728390a2660"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.36-darwin-amd64.tar.gz"
      sha256 "694d3b2974e3c1f531090e2df385e129e8e4be3ce1214c3323dc182e53683d69"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.36-linux-arm64.tar.gz"
      sha256 "de5dc77076c2fe8d61408228e5b95f28ebdc050b30b8b2cde63385a752b362a2"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.36-linux-amd64.tar.gz"
      sha256 "f7a51d6d9718d904f87ea6fdc8dac2944c70dff7445a9b36495cb96850d0ea81"
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
