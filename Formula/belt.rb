class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.26/inferencesh-cli-v1.18.26-darwin-arm64.tar.gz"
      sha256 "750b3ee48fd7a0fdf31f834ee06a97bb6e325b7bc7c0ce2c2601ed4f1c43d812"
    else
      url "https://dist.inference.sh/cli/v1.18.26/inferencesh-cli-v1.18.26-darwin-amd64.tar.gz"
      sha256 "3969a0112b62b6788215cde9c90206a3a9e8f5d9e7d200e96e6676a91a5c1e48"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.26/inferencesh-cli-v1.18.26-linux-arm64.tar.gz"
      sha256 "7e714b21414ff11359f64d94c25265b24396a967ffc9af7fdcd99c873dc2bf56"
    else
      url "https://dist.inference.sh/cli/v1.18.26/inferencesh-cli-v1.18.26-linux-amd64.tar.gz"
      sha256 "eed1d0d18739479e1ef4b9fc90821e6e488c76f60b817603698013d684c50c69"
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
