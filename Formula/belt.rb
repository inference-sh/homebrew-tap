class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.8-darwin-arm64.tar.gz"
      sha256 "9587edb353b9b4cb255b0c192d07a13e468ee61fafc69d2fe6c44a1b2a991a2a"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.8-darwin-amd64.tar.gz"
      sha256 "9c5f46e97427d6ef65e7a9ade59282436429aed8c3f79b76306890895e243ea0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.8-linux-arm64.tar.gz"
      sha256 "ebc12e57aa0ed18532ad23d21d31558e565ba41890caf11171e87c4e543fdf25"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.8-linux-amd64.tar.gz"
      sha256 "bb838cb567a6ca3342c8a3451f824c4b9041f9813f3def74af38c49663077335"
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
