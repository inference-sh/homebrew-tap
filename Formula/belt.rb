class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.14.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.2-darwin-arm64.tar.gz"
      sha256 "2ffe4dd28377e4b4eb81cb5facabee860bd43fdd00314788a54671358084f418"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.2-darwin-amd64.tar.gz"
      sha256 "d0029838def28bb7e5ea681147ad1a352cfa3464ce87c97721ec8ace97926a03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.2-linux-arm64.tar.gz"
      sha256 "11e7847529477c4a5eeaa49218e93e993d275a0a536d6409d7a75f634c3d3476"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.2-linux-amd64.tar.gz"
      sha256 "2628425a97af2c96d29802ab76bb4485af537b0f76a3677f3c731b15abcb2a2a"
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
