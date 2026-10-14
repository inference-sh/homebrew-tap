class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.2/inferencesh-cli-v1.25.2-darwin-arm64.tar.gz"
      sha256 "4f5521c2ac90b8c2c6b182616219434b7ac6eab12c81327446f16a0b4ba2a421"
    else
      url "https://dist.inference.sh/cli/v1.25.2/inferencesh-cli-v1.25.2-darwin-amd64.tar.gz"
      sha256 "66e0c5eb922e75363db1c77c0a15e3a8ab4fb8d669959bf2c28652ea84b5194a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.2/inferencesh-cli-v1.25.2-linux-arm64.tar.gz"
      sha256 "3eed3d2e7ed0a49b52e6a6ef0319d2490bd8d58dbf256ca02a8f8e6619bf194f"
    else
      url "https://dist.inference.sh/cli/v1.25.2/inferencesh-cli-v1.25.2-linux-amd64.tar.gz"
      sha256 "0dad76ed1822f5d4f9de6eeea23f7f542d922abe79eef4c0deb1e4e5156ebdc1"
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
