class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.14-darwin-arm64.tar.gz"
      sha256 "4a866264cdd4b5e4f92606727d4d536cd68a693b1a2567e3367e21c8534cff06"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.14-darwin-amd64.tar.gz"
      sha256 "dde8ce577217d47abb460c309f00911dc3fd38b67f6d7f5629179812b5c9417b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.14-linux-arm64.tar.gz"
      sha256 "03214b47bec7894b2b9a79eb624e0cff68115adedd0138e3490bd73abc519112"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.14-linux-amd64.tar.gz"
      sha256 "5509f7969928aa72c8b15ee8cce0b3c99ae63e57fe1b7b9ca5f5a75b11d616e6"
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
