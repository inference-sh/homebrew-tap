class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.23-darwin-arm64.tar.gz"
      sha256 "309e7f214299a5a618e4a8c6a4873315ad7534b04ec847ac8530617e521acd89"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.23-darwin-amd64.tar.gz"
      sha256 "7509bedfad3387895b92e68b35616d7e5c27f6bb78fa8415b1d4f957ed123844"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.23-linux-arm64.tar.gz"
      sha256 "047f37600c6f57401c1e8b8b0971abf0a4e09cd1a76a6169399994db19d0097c"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.23-linux-amd64.tar.gz"
      sha256 "ceb686f53d26c2a076f54002b42797b20e5b252a5b859c2fe51220016d087d96"
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
