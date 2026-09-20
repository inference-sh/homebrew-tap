class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.49"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.49/inferencesh-cli-v1.18.49-darwin-arm64.tar.gz"
      sha256 "7bd409d2c735683b808247f9af5a5226e052331f8460fcfa72279c29ef896ef9"
    else
      url "https://dist.inference.sh/cli/v1.18.49/inferencesh-cli-v1.18.49-darwin-amd64.tar.gz"
      sha256 "be38f610c52285f3f6c821dccd7b7f57075183c68d2e8ba52abccb84c548de6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.49/inferencesh-cli-v1.18.49-linux-arm64.tar.gz"
      sha256 "933167b071991ea4ebacadbb6a3763a52dee493f208916df23a4770e2184ba18"
    else
      url "https://dist.inference.sh/cli/v1.18.49/inferencesh-cli-v1.18.49-linux-amd64.tar.gz"
      sha256 "7dc9357dc5948b3fa169bdfafb457e94327ea3b37da5fa6bc5a990127b31b1b5"
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
