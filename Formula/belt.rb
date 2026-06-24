class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.14.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.0-darwin-arm64.tar.gz"
      sha256 "8ede684c0ca8eb4690be4e380914a2f05973bf903d4e1bc163039cf497fa05e6"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.0-darwin-amd64.tar.gz"
      sha256 "16859ee2ca6422725069cdf02a2e0ef2eda558121b6db26056fc62f677ecb9d9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.0-linux-arm64.tar.gz"
      sha256 "aec18f31299caa3fe4648ca13819d6c7e6b018c93d149f9a73b6d411d6bdfe64"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.0-linux-amd64.tar.gz"
      sha256 "6eb00a3d75472ea8715649405568c3162b7f5342f1d7024e2932d7f09fe6e38a"
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
