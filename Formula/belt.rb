class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.14/inferencesh-cli-v1.28.14-darwin-arm64.tar.gz"
      sha256 "33bf894052ac8268a83e9dd57651093d50d32bc5974e305be26dedd2a9127e3f"
    else
      url "https://dist.inference.sh/cli/v1.28.14/inferencesh-cli-v1.28.14-darwin-amd64.tar.gz"
      sha256 "97b65e663bdb18c7fdac188d04c1377ff60371f1d27d4410e205bbce67f654ba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.14/inferencesh-cli-v1.28.14-linux-arm64.tar.gz"
      sha256 "9aa33f4c689427d5f81646ee20ed690cb3f0030f2353792f658ae122d8c2d4c5"
    else
      url "https://dist.inference.sh/cli/v1.28.14/inferencesh-cli-v1.28.14-linux-amd64.tar.gz"
      sha256 "cd0ae5f647a0ea309da45cf042778b247ba1ff3064cdd389cff3a3b252c96f5a"
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
