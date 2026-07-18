class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.11/inferencesh-cli-v1.15.11-darwin-arm64.tar.gz"
      sha256 "01049cdd331296a81d6a46cce6a02e4a0e5e7346e29e8967d1dcc501550236ad"
    else
      url "https://dist.inference.sh/cli/v1.15.11/inferencesh-cli-v1.15.11-darwin-amd64.tar.gz"
      sha256 "32592910ce574e06da8c2f8405f2300945e5d0bc9ff7b2eac8f37b8c30760edc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.11/inferencesh-cli-v1.15.11-linux-arm64.tar.gz"
      sha256 "e3f9cdeb79d5926fbb61cfd060435d538b5e8d85b539c51241bdfd17fc55135e"
    else
      url "https://dist.inference.sh/cli/v1.15.11/inferencesh-cli-v1.15.11-linux-amd64.tar.gz"
      sha256 "8ef2f2fad16a460e1ee1e5f41ce7afd571434939ba88f99e3097cbe0a905fa0f"
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
