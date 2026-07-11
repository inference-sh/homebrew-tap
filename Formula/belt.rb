class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.14.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.20/inferencesh-cli-v1.14.20-darwin-arm64.tar.gz"
      sha256 "4a9decd54b5b86fc03bbd18d883ef5a222ec75d05aa74215a8b72a32aefb4f3b"
    else
      url "https://dist.inference.sh/cli/v1.14.20/inferencesh-cli-v1.14.20-darwin-amd64.tar.gz"
      sha256 "694e1a17aaf7b110abf366823a67d425f79c72b2128f1565b188d4eb59d5be6e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.20/inferencesh-cli-v1.14.20-linux-arm64.tar.gz"
      sha256 "5352d2c8a4562a908942aac06b4477198f1ba21eb131dc9796935b7124e185de"
    else
      url "https://dist.inference.sh/cli/v1.14.20/inferencesh-cli-v1.14.20-linux-amd64.tar.gz"
      sha256 "185ac76d49acccf1be3f93cb08fc7c7cf111f962fc0e53675a82089a1043a73c"
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
