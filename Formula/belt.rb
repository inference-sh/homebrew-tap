class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.15-darwin-arm64.tar.gz"
      sha256 "8290ec9c1c81b35f7138bb319a448826ae44117d4cff533ec19805a0cce846cb"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.15-darwin-amd64.tar.gz"
      sha256 "0551a10a77762b443d84b9ec67433eab7d69f7f4e9da4811fa6b4fe5377e7ebc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.15-linux-arm64.tar.gz"
      sha256 "1dc7bd2493e626ddc58ee65e61787c09241bea1cd6f6426d712fc0f767996a3c"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.15-linux-amd64.tar.gz"
      sha256 "cd23c0caed09186a32fc1e03c9565e7c02fd2094dd44c71b88e31c2905669247"
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
