class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.25-darwin-arm64.tar.gz"
      sha256 "862395ca1d25063ec98585371d5047057a4ba147a252c4a1d0ef867ec8a85ece"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.25-darwin-amd64.tar.gz"
      sha256 "ba1fd624ee226ff262cbed5616445fc556aa4442595e0ebf0bcaa412cb269331"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.25-linux-arm64.tar.gz"
      sha256 "5c12c943fdfac840f43fb78e5047fcff3ec093b0bea3ab4a3323b40c4bd94de9"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.25-linux-amd64.tar.gz"
      sha256 "ad67e621ac316c8578f7cf0497e059ae405742dbdb4e6cb810473e8948fed902"
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
