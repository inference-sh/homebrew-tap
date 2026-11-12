class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.39"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.39/inferencesh-cli-v1.28.39-darwin-arm64.tar.gz"
      sha256 "5b6599a96e93ce5561a3b4557a45712e6f8afb59e8451cde2b94b25b42ce0e28"
    else
      url "https://dist.inference.sh/cli/v1.28.39/inferencesh-cli-v1.28.39-darwin-amd64.tar.gz"
      sha256 "e1c76c01d3d5b7f0d10391703035cd77fc88facb08ed497b24622b61cb7ce2e2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.39/inferencesh-cli-v1.28.39-linux-arm64.tar.gz"
      sha256 "8ab85301f437875cafce7bca91550226e6bcd814d14abc10170eceee014be316"
    else
      url "https://dist.inference.sh/cli/v1.28.39/inferencesh-cli-v1.28.39-linux-amd64.tar.gz"
      sha256 "ef22a71f5d7c80d7851573eab5cae9935dccd6d09b1645753ed65ff900d4256e"
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
