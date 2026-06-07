class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.23-darwin-arm64.tar.gz"
      sha256 "2df9230ec4c9e09f8689c6c0157936867c156ccb8588be7118a6d17cf05f853b"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.23-darwin-amd64.tar.gz"
      sha256 "4e4e8b2b9efeeb24588dfac8193324c8fb911d1a649909b8e339baac85e70743"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.23-linux-arm64.tar.gz"
      sha256 "1165f4af931edf9454a3cecb37f156b77fa59d7ad52672a3b008fb454e97a2ee"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.23-linux-amd64.tar.gz"
      sha256 "a08f1e436b4757b78208dd334f268ba5000b4b7b27349dd8ebd48b05906469ec"
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
