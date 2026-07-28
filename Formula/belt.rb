class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.4/inferencesh-cli-v1.16.4-darwin-arm64.tar.gz"
      sha256 "690f290c290771d5e1ae831697f71f8ff7bc06b354d0646d0197b7f56f6d32fd"
    else
      url "https://dist.inference.sh/cli/v1.16.4/inferencesh-cli-v1.16.4-darwin-amd64.tar.gz"
      sha256 "7bc81eeec6f214709e423f539fe778bbddf0310338fa68c4040f16bbcc019d1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.4/inferencesh-cli-v1.16.4-linux-arm64.tar.gz"
      sha256 "af8f727244d47243d01452011ab06ac8d4953f22448957412d05f2000e750f19"
    else
      url "https://dist.inference.sh/cli/v1.16.4/inferencesh-cli-v1.16.4-linux-amd64.tar.gz"
      sha256 "1442e36ac8d3cf353dc34ab0f7eaf0fe0afffbd04f71e715b88ae9a6364b6e87"
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
