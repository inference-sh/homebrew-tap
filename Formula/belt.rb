class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.14/inferencesh-cli-v1.26.14-darwin-arm64.tar.gz"
      sha256 "d817a10b24e724928ac5e673fca52504682eb3093a9895b7a530853fd86fa8c2"
    else
      url "https://dist.inference.sh/cli/v1.26.14/inferencesh-cli-v1.26.14-darwin-amd64.tar.gz"
      sha256 "ea078b0a07f4a4ccd2a4b93c7e21adc011884dd8651e3ecf00c8dee4c6d1c14c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.14/inferencesh-cli-v1.26.14-linux-arm64.tar.gz"
      sha256 "ef27d048d924c35360059c908a1cfbcb1f27f6d9f6d7ade5b1d7777d71fb58e5"
    else
      url "https://dist.inference.sh/cli/v1.26.14/inferencesh-cli-v1.26.14-linux-amd64.tar.gz"
      sha256 "3c5dcfbec1ccbac913235ab2e6486cab678ad38795800a7444ffa37694ac6793"
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
