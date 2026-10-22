class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.9/inferencesh-cli-v1.26.9-darwin-arm64.tar.gz"
      sha256 "f1beaafb21a3425ea1ba6da84354633b8868d3645ae3d7c5e1635c838774d164"
    else
      url "https://dist.inference.sh/cli/v1.26.9/inferencesh-cli-v1.26.9-darwin-amd64.tar.gz"
      sha256 "2a5f0ca4e5e46ce3742e5ba318160447ee6f890d0fecfda13084c9dd3288778b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.9/inferencesh-cli-v1.26.9-linux-arm64.tar.gz"
      sha256 "1840a1529688fd085321df8ac2e7e82efb851b324cd2925b53af100e99743ae7"
    else
      url "https://dist.inference.sh/cli/v1.26.9/inferencesh-cli-v1.26.9-linux-amd64.tar.gz"
      sha256 "afbe510070ece749917793d4e35612ec7d39b8324b1a1634d601d7c5bb6539e5"
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
