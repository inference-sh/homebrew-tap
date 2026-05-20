class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.1-darwin-arm64.tar.gz"
      sha256 "c2f4029d9b2cc35a05640f424df3c73d1f2f7248315cfc14c7bc818fe809153a"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.1-darwin-amd64.tar.gz"
      sha256 "87bb5e5cc486607d286cdb82b9f87899dbad6a6afdc3ce74edd50cb3cb8e97ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.1-linux-arm64.tar.gz"
      sha256 "595410185cd16423cf450177ccf903b20fa4df86823a36cb004a2a8a1f172afc"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.1-linux-amd64.tar.gz"
      sha256 "a54c1b15bed4aec0536637974a1e197adf4fcefd892bf5136343b0b6fec23380"
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
