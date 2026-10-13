class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.0/inferencesh-cli-v1.25.0-darwin-arm64.tar.gz"
      sha256 "cd06a405f7270ee5a8338c6e7193c776733d84d29891127066e0951aec6805f8"
    else
      url "https://dist.inference.sh/cli/v1.25.0/inferencesh-cli-v1.25.0-darwin-amd64.tar.gz"
      sha256 "cd3a81d993f2f20c4ac4e49178d9bccb8eaadc3dffd60dd6fa879bfef7b73803"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.0/inferencesh-cli-v1.25.0-linux-arm64.tar.gz"
      sha256 "4d25189075e5b07ae6d1cdee968d58f30d5fac07091d0d62e89185a445107e07"
    else
      url "https://dist.inference.sh/cli/v1.25.0/inferencesh-cli-v1.25.0-linux-amd64.tar.gz"
      sha256 "a2697da65d18e818b1a02ed2855dd91fa010e59b4b2d48f8127ed27e11b70bb4"
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
