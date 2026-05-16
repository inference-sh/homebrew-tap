class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.1-darwin-arm64.tar.gz"
      sha256 "dfc6168845a490988024960749e29ed7334d27ab6ee37e63fe179856879e1904"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.1-darwin-amd64.tar.gz"
      sha256 "7a76b98bd163fa7bbba52e170c1484c52ffe1e352fbf8a03b74c5e615b18d6f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.1-linux-arm64.tar.gz"
      sha256 "3a751f0321efa93fae51a04d51a89bda49514fd057f8c1d97c3fcaac0b22b6c7"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.1-linux-amd64.tar.gz"
      sha256 "1ae32d75bc0770338591151e987d4a717460ff91136bd13610d590f30a6614c1"
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
