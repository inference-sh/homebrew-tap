class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.15/inferencesh-cli-v1.28.15-darwin-arm64.tar.gz"
      sha256 "b45767f35c20c709cae47d16c40068dd474aa9e78088121a8cd8f250a59874b0"
    else
      url "https://dist.inference.sh/cli/v1.28.15/inferencesh-cli-v1.28.15-darwin-amd64.tar.gz"
      sha256 "00149643ddf9b67bd210936af32f430d2f590ec827700905405a4373f707c320"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.15/inferencesh-cli-v1.28.15-linux-arm64.tar.gz"
      sha256 "75a23a16cb18718b753f4e333ba77afd89b95c48fe1bbd7896057b6c4a2be680"
    else
      url "https://dist.inference.sh/cli/v1.28.15/inferencesh-cli-v1.28.15-linux-amd64.tar.gz"
      sha256 "1c1383c8abb9a98e1f9828b80e3fad66bb4769fc100cb2431dcb17efbbab00ac"
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
