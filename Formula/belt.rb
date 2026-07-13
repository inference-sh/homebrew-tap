class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.3/inferencesh-cli-v1.15.3-darwin-arm64.tar.gz"
      sha256 "25434aeabf35f7d4743b7bc6be418fde39dced56195e1ac2994ced61285ed81e"
    else
      url "https://dist.inference.sh/cli/v1.15.3/inferencesh-cli-v1.15.3-darwin-amd64.tar.gz"
      sha256 "29623eed45b7be369063c6996b80ddfdd00a5198d8602883ca92931091d9e854"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.3/inferencesh-cli-v1.15.3-linux-arm64.tar.gz"
      sha256 "b5fe329b500c97b180f6be01248ce25399ee11063583bd5d664ff528b770c7e5"
    else
      url "https://dist.inference.sh/cli/v1.15.3/inferencesh-cli-v1.15.3-linux-amd64.tar.gz"
      sha256 "bae1150d9cc53157c745770fad78f762e047c8c1290880d6265a2b0cab0a7452"
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
