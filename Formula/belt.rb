class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.23"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.23/inferencesh-cli-v1.28.23-darwin-arm64.tar.gz"
      sha256 "6bd4894151effbc4723fb5b54316a4e2256be5c94f67e29fde0a48b0f39f61e5"
    else
      url "https://dist.inference.sh/cli/v1.28.23/inferencesh-cli-v1.28.23-darwin-amd64.tar.gz"
      sha256 "4dc0fc5ad9d915e3eedbfcf9a39c3f3709b66a9a7e441571895c177dec151946"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.23/inferencesh-cli-v1.28.23-linux-arm64.tar.gz"
      sha256 "e0fc222b77b06b11b5193af6ab0e8f91e3e4573b983a683a610aae2f49d83010"
    else
      url "https://dist.inference.sh/cli/v1.28.23/inferencesh-cli-v1.28.23-linux-amd64.tar.gz"
      sha256 "fa2002ba305715e33f113073b46a3a57188beb399b71bdee6d827befc0203164"
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
