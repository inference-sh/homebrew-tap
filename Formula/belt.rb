class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.57"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.57/inferencesh-cli-v1.18.57-darwin-arm64.tar.gz"
      sha256 "ba110d8dc2b089e95cc46266e8baf157b3ab90bfb536aafde36c96be40e93e77"
    else
      url "https://dist.inference.sh/cli/v1.18.57/inferencesh-cli-v1.18.57-darwin-amd64.tar.gz"
      sha256 "e808f36f15396394f352a94a29476b8b2395d6038afd9a201a2fb45f70ab6a38"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.57/inferencesh-cli-v1.18.57-linux-arm64.tar.gz"
      sha256 "bd04c9c008fd255eda54da554a2b2ae03bc47b31e919bbfc0c1f5760dbf824bf"
    else
      url "https://dist.inference.sh/cli/v1.18.57/inferencesh-cli-v1.18.57-linux-amd64.tar.gz"
      sha256 "ef28d478f2f4a1d35d1b9a4cac855285287ea3e4903b239934bde17c187824f6"
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
