class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.11/inferencesh-cli-v1.25.11-darwin-arm64.tar.gz"
      sha256 "ec93cbe6f7b4873f6c1f2602e19b5752070e4bbcdb0e6970e18b80efd053154a"
    else
      url "https://dist.inference.sh/cli/v1.25.11/inferencesh-cli-v1.25.11-darwin-amd64.tar.gz"
      sha256 "4d78881369a9cd03bad868c0467728e8c65e0c2528e09b6cb2697c9e5d5fe158"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.11/inferencesh-cli-v1.25.11-linux-arm64.tar.gz"
      sha256 "f877102457bfc1cda49fb8f77d6a123d8aad919cf7756e4e52eb8fc83ce5d60a"
    else
      url "https://dist.inference.sh/cli/v1.25.11/inferencesh-cli-v1.25.11-linux-amd64.tar.gz"
      sha256 "d09e53de487b61a4f69815263d6a74a8b4f81f8be7ac81eaa304b170f2c9067d"
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
