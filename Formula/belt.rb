class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.20-darwin-arm64.tar.gz"
      sha256 "a9b916f8860fb040ecd2b4c3f7bbd372e14b6414e3ebe8f244c56f271a77896a"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.20-darwin-amd64.tar.gz"
      sha256 "90ed6bf8dd1142971e3a0b3e38d50dc924b91020e75c656a5426337518709535"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.20-linux-arm64.tar.gz"
      sha256 "45b1a1994b2edc96c4c575c3ef15325cae787ea82fb26bfc0c3f6e1e7185ba03"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.20-linux-amd64.tar.gz"
      sha256 "2f804873e4aa31344f2a7332f1bb45d60da62759659b30e05cf8560c672118e9"
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
