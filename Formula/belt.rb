class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.24-darwin-arm64.tar.gz"
      sha256 "667386579a138186bd1d255bf28092a94ac5feeecc554131f74d9b6fbc3e676f"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.24-darwin-amd64.tar.gz"
      sha256 "559865c449af525379c3de631ea8cb25f5ddcb80e354e96f810beae3f741e6b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.24-linux-arm64.tar.gz"
      sha256 "a0f40bf795a431b6b4d6f645fd26499f6d8b8f7ca87a32f1fd6acb527a9b780e"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.24-linux-amd64.tar.gz"
      sha256 "53fb1b7edfe490cdbcb79a298044a6fc729513794330c2337914a894fbcf2036"
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
