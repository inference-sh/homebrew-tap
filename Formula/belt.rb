class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.0/inferencesh-cli-v1.26.0-darwin-arm64.tar.gz"
      sha256 "b9f42d3acfb33ae3c984091107a916769704621ec3c2995563d0436aa9998a41"
    else
      url "https://dist.inference.sh/cli/v1.26.0/inferencesh-cli-v1.26.0-darwin-amd64.tar.gz"
      sha256 "8c4891e01dc191b027b11ecb6854688a414febb4c10410eaecfd1ad514fa1363"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.0/inferencesh-cli-v1.26.0-linux-arm64.tar.gz"
      sha256 "5eb4cc7427593296a09cbd2190bd0cdc2f7ef3667b24309b8fcb32657259c077"
    else
      url "https://dist.inference.sh/cli/v1.26.0/inferencesh-cli-v1.26.0-linux-amd64.tar.gz"
      sha256 "cd6fca8d3cc34941a3927d8cfe7e3d591671ae0001abde491f558a2957221ec6"
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
