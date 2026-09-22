class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.55"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.55/inferencesh-cli-v1.18.55-darwin-arm64.tar.gz"
      sha256 "1be06a7a8c289e7534107d8960e2def740d9b8e89826d54aeed486a02f1d0717"
    else
      url "https://dist.inference.sh/cli/v1.18.55/inferencesh-cli-v1.18.55-darwin-amd64.tar.gz"
      sha256 "fce96cfb8d2f1b3e52b03937f31b8c246274f66bf7332002779882f9a96ff265"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.55/inferencesh-cli-v1.18.55-linux-arm64.tar.gz"
      sha256 "2cc56fec24b1afca70c5a3e7dc11da7145d48f6813defd8951a8ff1703c23ed7"
    else
      url "https://dist.inference.sh/cli/v1.18.55/inferencesh-cli-v1.18.55-linux-amd64.tar.gz"
      sha256 "7b553bb830674f1d05312b1543ec4444e9d9bb92ee934fe821a56ce09474e32a"
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
