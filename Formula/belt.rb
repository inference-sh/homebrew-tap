class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.22-darwin-arm64.tar.gz"
      sha256 "48f536aac3af0dc9ceec0db7cc69f3fb8b60041cd6ec9a060878d455c8e9bbd7"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.22-darwin-amd64.tar.gz"
      sha256 "22bff12ed0d85fcf993d03abbc3edde656c3ba02f5cd2c49a68be11250d88ddf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.22-linux-arm64.tar.gz"
      sha256 "73beb6402861779a2efb1bf25ebfa9d085d9100ed61a416c18ab6b61cbe9e93d"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.22-linux-amd64.tar.gz"
      sha256 "d98c53239fc94251ddddc2b6b3e973a0a6744330fe507c96340249bba5d43c0a"
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
