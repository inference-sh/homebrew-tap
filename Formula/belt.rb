class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.7/inferencesh-cli-v1.19.7-darwin-arm64.tar.gz"
      sha256 "9734c24a59e9e26b72e345d4293b585d5b420e39d99e52ccb4de53872b08196f"
    else
      url "https://dist.inference.sh/cli/v1.19.7/inferencesh-cli-v1.19.7-darwin-amd64.tar.gz"
      sha256 "b519053794245859bead12f65d6da299574960bc2a9617ca5ae952c62e2f2fe7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.7/inferencesh-cli-v1.19.7-linux-arm64.tar.gz"
      sha256 "1c95da7813856d6700bc64fd1fcb6e9f1ad812ea6d2e91b93ea2418ec5c7d52b"
    else
      url "https://dist.inference.sh/cli/v1.19.7/inferencesh-cli-v1.19.7-linux-amd64.tar.gz"
      sha256 "e38d52d1775d48ea231de94be201711219edd7a05bad178a51ec7b83b5158f13"
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
