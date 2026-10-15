class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.8/inferencesh-cli-v1.25.8-darwin-arm64.tar.gz"
      sha256 "c118fcec19704f12ab24586f1523deb02c8a3dbe293349cb8aec0fe76fd27dbd"
    else
      url "https://dist.inference.sh/cli/v1.25.8/inferencesh-cli-v1.25.8-darwin-amd64.tar.gz"
      sha256 "ad714ae2dc760abfa947e0a489b905635ac321ea31c073b79eed0a556eeca092"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.8/inferencesh-cli-v1.25.8-linux-arm64.tar.gz"
      sha256 "c967b4096090f2a848f007730c45225c512a1518c79153824f33b8483bb4d41d"
    else
      url "https://dist.inference.sh/cli/v1.25.8/inferencesh-cli-v1.25.8-linux-amd64.tar.gz"
      sha256 "1336c30ba4d6da1af9bf958054b4e5b3d8e69650a7a933674dc821d81f156169"
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
