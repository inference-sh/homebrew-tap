class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.5/inferencesh-cli-v1.15.5-darwin-arm64.tar.gz"
      sha256 "4473a21cf2d4d37b5fee18214a88996341c205ada39be1b92555754f6d7c41fb"
    else
      url "https://dist.inference.sh/cli/v1.15.5/inferencesh-cli-v1.15.5-darwin-amd64.tar.gz"
      sha256 "766ab74e0cf5dd091eb73ed7ed7517360cc4334388de254d5e443ecc15702e79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.5/inferencesh-cli-v1.15.5-linux-arm64.tar.gz"
      sha256 "1ddc17d1868272bf54b4a3736083d2c71e79988c4b506c36677f9bb85ddd1638"
    else
      url "https://dist.inference.sh/cli/v1.15.5/inferencesh-cli-v1.15.5-linux-amd64.tar.gz"
      sha256 "633b19f047c395b13e8191edc2b69378eb963e9001893c05b3937b71f98fd5ca"
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
