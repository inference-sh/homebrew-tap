class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.18/inferencesh-cli-v1.16.18-darwin-arm64.tar.gz"
      sha256 "aceac9c4fe4630010525fe37d3eec787895510ae9b09f17b3936a7569bdb3912"
    else
      url "https://dist.inference.sh/cli/v1.16.18/inferencesh-cli-v1.16.18-darwin-amd64.tar.gz"
      sha256 "20ab8faba93d856a31d7508161500b683c14eaaa45c988205f95f1507feb9516"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.18/inferencesh-cli-v1.16.18-linux-arm64.tar.gz"
      sha256 "2bb9edab8d896c6274863012f7ee23a4afac1452e3550a90d41cc1bbfa58375d"
    else
      url "https://dist.inference.sh/cli/v1.16.18/inferencesh-cli-v1.16.18-linux-amd64.tar.gz"
      sha256 "5d9ae646a478fae57475e30662db218c3a2c148e446a3a634d3889799ec90001"
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
