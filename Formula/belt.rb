class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.1/inferencesh-cli-v1.19.1-darwin-arm64.tar.gz"
      sha256 "80608d68e739a303282bbac7e7a3db79f1efbd5ece8ddacbb1bac3804602d4ec"
    else
      url "https://dist.inference.sh/cli/v1.19.1/inferencesh-cli-v1.19.1-darwin-amd64.tar.gz"
      sha256 "516eb00145953434ca74402c14ec3922eb605fd60b98e1d0f9ee9f9e1f68a65d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.1/inferencesh-cli-v1.19.1-linux-arm64.tar.gz"
      sha256 "9e700f867f36ad35a4d3b243521d60daf20a482da92067515af21b15122f397c"
    else
      url "https://dist.inference.sh/cli/v1.19.1/inferencesh-cli-v1.19.1-linux-amd64.tar.gz"
      sha256 "4373ef96a781713a0d223c14c7305a74c10e14d8a9bf5f1c8ebf0ff6198a98ad"
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
