class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.10-darwin-arm64.tar.gz"
      sha256 "98cfd7a2ca676652767c27596623cb4acd6482b326595725980ea07b8d65ef99"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.10-darwin-amd64.tar.gz"
      sha256 "72fa966f055f701119f0a9f8cc20eea20a401f0439fdc33685d27b8fa518c1a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.10-linux-arm64.tar.gz"
      sha256 "5c324d8751e853bea8d95305798a1cb052d9be259be769e3426d9703770a519c"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.10-linux-amd64.tar.gz"
      sha256 "ec25b653d7ec18088a74e576888b14f74dfe8f1c38a8d694e7c9ccb5c37d6789"
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
