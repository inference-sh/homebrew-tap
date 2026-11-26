class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.16/inferencesh-cli-v1.29.16-darwin-arm64.tar.gz"
      sha256 "e18b43b0e2f09db975afaa16a5b0b22df4e8b3d0304f7b1ba146dd25b60d91bd"
    else
      url "https://dist.inference.sh/cli/v1.29.16/inferencesh-cli-v1.29.16-darwin-amd64.tar.gz"
      sha256 "d6519bea1b66622a2f6a6cecd54f396b0a2af17ff90393b43928d5c30cb000cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.16/inferencesh-cli-v1.29.16-linux-arm64.tar.gz"
      sha256 "d06c9a23cd0ca2fcd675cc3bfad9ba25c564add434c77551afc2b35cb4598aa6"
    else
      url "https://dist.inference.sh/cli/v1.29.16/inferencesh-cli-v1.29.16-linux-amd64.tar.gz"
      sha256 "527e955065aad6054a29fd4494b4cac234f7ba2993a91d05613b032422d146c0"
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
