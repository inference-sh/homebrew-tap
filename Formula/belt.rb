class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.23/inferencesh-cli-v1.15.23-darwin-arm64.tar.gz"
      sha256 "fc8be94b0174f07f90cab0e6a231aaedba30fb852ee8cf55815cf2d435dea7d1"
    else
      url "https://dist.inference.sh/cli/v1.15.23/inferencesh-cli-v1.15.23-darwin-amd64.tar.gz"
      sha256 "76bb56da9ec222efbbe1ae0cac81b5385348bd7eaec23cdb5e1e274270fa27e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.23/inferencesh-cli-v1.15.23-linux-arm64.tar.gz"
      sha256 "b9520f6075f704cd6d5a0e9397fb153eda5c52bdf9ec379e7bf50848eceea912"
    else
      url "https://dist.inference.sh/cli/v1.15.23/inferencesh-cli-v1.15.23-linux-amd64.tar.gz"
      sha256 "c02773bc3207811f5653d4a0e1e2404c7b84ea44053f47f7b787dd1120696dd7"
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
