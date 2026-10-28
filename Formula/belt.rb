class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.1/inferencesh-cli-v1.28.1-darwin-arm64.tar.gz"
      sha256 "f4763e321641332f33e5a93b0eb88d44e0053f1e195651bd55917dd6d9bf9c21"
    else
      url "https://dist.inference.sh/cli/v1.28.1/inferencesh-cli-v1.28.1-darwin-amd64.tar.gz"
      sha256 "7cacd4b7c4ed42a7e6da8d25ee5bfbbd2705358412a17c12cdb9ce7bfeaaa8f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.1/inferencesh-cli-v1.28.1-linux-arm64.tar.gz"
      sha256 "2a67c86de0d0e6ba6ee8f03c7c58829c5d6f9a603289aee7e9efb75b08645ada"
    else
      url "https://dist.inference.sh/cli/v1.28.1/inferencesh-cli-v1.28.1-linux-amd64.tar.gz"
      sha256 "e1963aa5f5dd21bd20418bf694f2e839b59e19fa4e006f97153087e6212a6161"
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
