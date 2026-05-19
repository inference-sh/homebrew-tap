class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.26-darwin-arm64.tar.gz"
      sha256 "de8cabddff84f4798146b2fd3bc28defc2921cedfe4e79e43831cbe7910be54f"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.26-darwin-amd64.tar.gz"
      sha256 "89ba34cdaf28f66dcdf67fda6ff3069469025b42e501a7472b0c72d2092d0d11"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.26-linux-arm64.tar.gz"
      sha256 "70f926685b257d6bd8d4867f4e1bbe83733c5259b99dadaa8a9c43bcabd616d0"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.26-linux-amd64.tar.gz"
      sha256 "d37af606bbde0ac1ea87cf2f103084ba2e937dcde1073444c27502a3b69c3f01"
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
