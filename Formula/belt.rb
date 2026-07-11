class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.1/inferencesh-cli-v1.15.1-darwin-arm64.tar.gz"
      sha256 "f8a5e6f9124142f5986a98e83efcd508ac22b05052aa36bb96991a4fc6f3e6c2"
    else
      url "https://dist.inference.sh/cli/v1.15.1/inferencesh-cli-v1.15.1-darwin-amd64.tar.gz"
      sha256 "3b08d78b791162a50260a657a7ab9a4a2560907193251e0f4017bd975df59562"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.1/inferencesh-cli-v1.15.1-linux-arm64.tar.gz"
      sha256 "21ef44ce92aa19d355eeb96679e849bfaf30f79d319d93f78745b093b0390a7a"
    else
      url "https://dist.inference.sh/cli/v1.15.1/inferencesh-cli-v1.15.1-linux-amd64.tar.gz"
      sha256 "8747a8fbc493212f5fe6f8e2d6462a4066afa6f4d84059db1a6bf0d33fb5ebee"
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
