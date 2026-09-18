class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.39"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.39/inferencesh-cli-v1.18.39-darwin-arm64.tar.gz"
      sha256 "7e7a076aea8b7d4760031c72d83517e39928ece3520996fcfba2314dde6f36e6"
    else
      url "https://dist.inference.sh/cli/v1.18.39/inferencesh-cli-v1.18.39-darwin-amd64.tar.gz"
      sha256 "eb02c970c4c5f55435305db8490e60aef953e5d7888933c6f3f2bf2e45b46dc1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.39/inferencesh-cli-v1.18.39-linux-arm64.tar.gz"
      sha256 "b0249f6db1329f3deb97e8d7348c49b8e72c47679a73d06f8687f619f38e0d72"
    else
      url "https://dist.inference.sh/cli/v1.18.39/inferencesh-cli-v1.18.39-linux-amd64.tar.gz"
      sha256 "a050a1da70bda4974bd17846c7396c56a1259e75b105bd1c69879d868f890694"
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
