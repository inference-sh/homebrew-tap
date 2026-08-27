class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.5/inferencesh-cli-v1.18.5-darwin-arm64.tar.gz"
      sha256 "e06966feaf4b60fc8e92d9fc248519aed980edbe5d855a3f657e8dc0615ea509"
    else
      url "https://dist.inference.sh/cli/v1.18.5/inferencesh-cli-v1.18.5-darwin-amd64.tar.gz"
      sha256 "c437e6d230c0066eb8cf5590a2a16e57e4b1c48879377600b4dc0f5bf64dc475"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.5/inferencesh-cli-v1.18.5-linux-arm64.tar.gz"
      sha256 "cc61b4b48edac8ba729f2f5864f39b5039639708b08cfb170f1940091b74b251"
    else
      url "https://dist.inference.sh/cli/v1.18.5/inferencesh-cli-v1.18.5-linux-amd64.tar.gz"
      sha256 "0776721770c8e485770a680b1308b3075aafb481c6b4f6ec3b6f4b1a5faa0e43"
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
