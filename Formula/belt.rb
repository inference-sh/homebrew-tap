class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.37"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.37/inferencesh-cli-v1.18.37-darwin-arm64.tar.gz"
      sha256 "e8b1472801e212a3d06917baef355bca2a1be6b760df45c3953c1ab7e6685705"
    else
      url "https://dist.inference.sh/cli/v1.18.37/inferencesh-cli-v1.18.37-darwin-amd64.tar.gz"
      sha256 "b211bb397adc94c4c62150442b0124c58fbc11cd2bfabe6a2da380ba3be306be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.37/inferencesh-cli-v1.18.37-linux-arm64.tar.gz"
      sha256 "a6994410c33739a255625185a0e2754659cfc1ca808e3b150a1fc124a07a2258"
    else
      url "https://dist.inference.sh/cli/v1.18.37/inferencesh-cli-v1.18.37-linux-amd64.tar.gz"
      sha256 "a3e62ab3520aef41b157beb3bb969fa7e752a986473f61ccaaea6a42c98999a3"
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
