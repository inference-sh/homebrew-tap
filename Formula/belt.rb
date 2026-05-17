class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.19-darwin-arm64.tar.gz"
      sha256 "4709e28cdc7cb1264938196d9d64ab0d0adecf93e50ad09a4e3604fa322a9a74"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.19-darwin-amd64.tar.gz"
      sha256 "73e203c3764f2416ea335b04ca1fd37e73764a11c8075435f97dc9ae8261c189"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.19-linux-arm64.tar.gz"
      sha256 "86d45bd1832443810bf569bd29d4c8b762ff41132192b4ed8ef96230f4f8839b"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.19-linux-amd64.tar.gz"
      sha256 "ff1dadeed7581a42eb995119193c733ac873d330ccaef318946622774f4bd2e7"
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
