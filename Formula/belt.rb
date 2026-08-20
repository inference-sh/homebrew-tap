class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.29/inferencesh-cli-v1.17.29-darwin-arm64.tar.gz"
      sha256 "5dfc401417cba2adea916c871d1c2a74331709dc83e0d3ed4d787a79b4a4b16a"
    else
      url "https://dist.inference.sh/cli/v1.17.29/inferencesh-cli-v1.17.29-darwin-amd64.tar.gz"
      sha256 "de77c372c4128c3608aa14622dcccdc1cbcd072ead8e1f787c1f510d967d6afc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.29/inferencesh-cli-v1.17.29-linux-arm64.tar.gz"
      sha256 "8f04ce676917507017edd2816cfb9b80d2880a347c6f43862c97eb0f43a61b25"
    else
      url "https://dist.inference.sh/cli/v1.17.29/inferencesh-cli-v1.17.29-linux-amd64.tar.gz"
      sha256 "855b4e5c90e2d141a5080a43463b8d545b464438da87091f52555d6c8833e30a"
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
