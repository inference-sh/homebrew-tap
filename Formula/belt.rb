class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.43"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.43/inferencesh-cli-v1.28.43-darwin-arm64.tar.gz"
      sha256 "0d72a6d1e3a4ff3c762ae19217911055e57bc90a618a6eb7da6276aa0d48c16c"
    else
      url "https://dist.inference.sh/cli/v1.28.43/inferencesh-cli-v1.28.43-darwin-amd64.tar.gz"
      sha256 "517bfe736b8719e3daa5d7a963720ba1ce944ebd15eac522dbc0fd634520c17f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.43/inferencesh-cli-v1.28.43-linux-arm64.tar.gz"
      sha256 "6b414734014a303cf78077c028394e0ad550a4ad26f8eb84213b428676340b07"
    else
      url "https://dist.inference.sh/cli/v1.28.43/inferencesh-cli-v1.28.43-linux-amd64.tar.gz"
      sha256 "4978cb2bae88f456140e780f001f9c4d62b1ae5bb75c16241f8ec4f32dda3276"
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
