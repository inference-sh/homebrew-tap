class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.32/inferencesh-cli-v1.17.32-darwin-arm64.tar.gz"
      sha256 "d68237464b06bf6116c6e89007e316fd8481b8d6ee1b61a3bb323fb302fa1df4"
    else
      url "https://dist.inference.sh/cli/v1.17.32/inferencesh-cli-v1.17.32-darwin-amd64.tar.gz"
      sha256 "d2dd08fb0c499bb408d4aece759bffdcf0e933e8ea5cd4e69ef2ed55afd60e3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.32/inferencesh-cli-v1.17.32-linux-arm64.tar.gz"
      sha256 "43ef6c4a743268fa3a47e479b755bfe822398b0936d4ed633cb64a744a4ac068"
    else
      url "https://dist.inference.sh/cli/v1.17.32/inferencesh-cli-v1.17.32-linux-amd64.tar.gz"
      sha256 "199038c7da9b6acb7d6c106c1f6d2b49a1f91918667ba16fdae17b44db5b271e"
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
