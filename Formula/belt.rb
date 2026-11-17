class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.5/inferencesh-cli-v1.29.5-darwin-arm64.tar.gz"
      sha256 "3ed124dfdbad59f4addec9d56de0d385a7ae613d0398725d7b9ce1339f8dcbb8"
    else
      url "https://dist.inference.sh/cli/v1.29.5/inferencesh-cli-v1.29.5-darwin-amd64.tar.gz"
      sha256 "9c6ecf33695bf8ac276acc69600abc575deb8674b61e2c1afeab95a2163e5f36"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.5/inferencesh-cli-v1.29.5-linux-arm64.tar.gz"
      sha256 "89ac7c37d8b30455b3cdf6f815f0ac2b1f8aa9d84b17d24043129ca722137a94"
    else
      url "https://dist.inference.sh/cli/v1.29.5/inferencesh-cli-v1.29.5-linux-amd64.tar.gz"
      sha256 "c4325280b24a5672cb778d05fd9de42ca3a307bc3a0d1475280e6797e666e45c"
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
