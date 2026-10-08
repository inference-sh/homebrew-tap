class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.22/inferencesh-cli-v1.19.22-darwin-arm64.tar.gz"
      sha256 "1a00922df741f36b06f3f451bae2458b61c05cff065013ce3e3742a68447b0d2"
    else
      url "https://dist.inference.sh/cli/v1.19.22/inferencesh-cli-v1.19.22-darwin-amd64.tar.gz"
      sha256 "ecc0d00ef4db4d85f10b9ebdd4d82ca07c746e9a584134e0ef62ab2ace73d6eb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.22/inferencesh-cli-v1.19.22-linux-arm64.tar.gz"
      sha256 "a00b2d96324ad3324b3bf8e1110640047fedd783c5c849d2d91a69ad05fbde8c"
    else
      url "https://dist.inference.sh/cli/v1.19.22/inferencesh-cli-v1.19.22-linux-amd64.tar.gz"
      sha256 "519ccff20cb6de5e5b22744a25bb1b014949e16ae2e982dc5fa3acc2ac48e95a"
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
