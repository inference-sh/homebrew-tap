class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.5/inferencesh-cli-v1.26.5-darwin-arm64.tar.gz"
      sha256 "18619ea5585eca5b705ca7dac2968d6c2502aa65a841f62eb5ca568823bef4f8"
    else
      url "https://dist.inference.sh/cli/v1.26.5/inferencesh-cli-v1.26.5-darwin-amd64.tar.gz"
      sha256 "dc3d0e9d8a1d6badd4e8270e37f01cd07e9297317bae448c62dcca090445c6fb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.5/inferencesh-cli-v1.26.5-linux-arm64.tar.gz"
      sha256 "3688c6d26af0e62d07a6c96578671ee10473185e31415b35df64263d19e733fb"
    else
      url "https://dist.inference.sh/cli/v1.26.5/inferencesh-cli-v1.26.5-linux-amd64.tar.gz"
      sha256 "884ca58afdc789ac936f810b7da8c5abcedeb26a9be3a9ba35f7a256131195fb"
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
