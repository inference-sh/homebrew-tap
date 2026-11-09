class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.27/inferencesh-cli-v1.28.27-darwin-arm64.tar.gz"
      sha256 "be715b375dc04b14b4bedd4490ec141552b5c4539eecf9f0d009e44c4dabe400"
    else
      url "https://dist.inference.sh/cli/v1.28.27/inferencesh-cli-v1.28.27-darwin-amd64.tar.gz"
      sha256 "3a34f692ed4c68e2d8bac70182fdb0a0489fca3a4a0f42ba138615462035e668"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.27/inferencesh-cli-v1.28.27-linux-arm64.tar.gz"
      sha256 "47ab1031190a9cbf8cb09bd8138998ffa48ed505ae6cf8c6ab579107de9ddbc5"
    else
      url "https://dist.inference.sh/cli/v1.28.27/inferencesh-cli-v1.28.27-linux-amd64.tar.gz"
      sha256 "a421d0ca840d53d8ae9c239971ae48aa71be0d9443a9a094e31485a083107135"
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
