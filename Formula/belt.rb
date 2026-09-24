class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.59"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.59/inferencesh-cli-v1.18.59-darwin-arm64.tar.gz"
      sha256 "90edc1d5e5238923da644a0d2bd146b5f447cb530c876689c27f8842de3ded22"
    else
      url "https://dist.inference.sh/cli/v1.18.59/inferencesh-cli-v1.18.59-darwin-amd64.tar.gz"
      sha256 "b4aff87fefb8d5b70e8b9e41cba3507b4a151e533c6c247dc7dfc9852b310a0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.59/inferencesh-cli-v1.18.59-linux-arm64.tar.gz"
      sha256 "8de514320db01d4cd95a4b6f85492ed6271b443f13ee782bf8f9edb555b6272d"
    else
      url "https://dist.inference.sh/cli/v1.18.59/inferencesh-cli-v1.18.59-linux-amd64.tar.gz"
      sha256 "63f33094240a1eda301a4fff189e784fa187c4e535188bb924816318d571f250"
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
