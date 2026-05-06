class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.10-darwin-arm64.tar.gz"
      sha256 "4000d0c8261460b79b9afb18c2da1b5ad2dd6de3fc3295b4d8485086074603b3"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.10-darwin-amd64.tar.gz"
      sha256 "b78dfe44ce514a50b09545e65611ce7e4ac1a47278d3d8adfdc7d7ff987d79f2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.10-linux-arm64.tar.gz"
      sha256 "a308badacbfb9da9a1f33254fb09485013fc3254f96e48494f7d781534214522"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.10-linux-amd64.tar.gz"
      sha256 "1200b0948c32092d93b905b438c0d0f338d4032a1087202071b92f58ea63c134"
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
