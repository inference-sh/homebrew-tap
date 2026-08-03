class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.24/inferencesh-cli-v1.16.24-darwin-arm64.tar.gz"
      sha256 "22e81eaf5eb514228ff83c6f864bd2dfc20df9fdf4c74b4fa9b3a30a421f6ea4"
    else
      url "https://dist.inference.sh/cli/v1.16.24/inferencesh-cli-v1.16.24-darwin-amd64.tar.gz"
      sha256 "e8374fdbc083b65d4f42095e301d159dd3e8952c398658c53e468c9ccd4b2db0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.24/inferencesh-cli-v1.16.24-linux-arm64.tar.gz"
      sha256 "205d2e00b468c7b14617c8c185bf624003c394e725043dd7cd305d9fc8b6835e"
    else
      url "https://dist.inference.sh/cli/v1.16.24/inferencesh-cli-v1.16.24-linux-amd64.tar.gz"
      sha256 "9faf6386b8e6bffc772bc905f41864401394125517ee7efc7d51b0f225210d5a"
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
