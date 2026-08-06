class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.7/inferencesh-cli-v1.17.7-darwin-arm64.tar.gz"
      sha256 "365ad47d1d057fc89ddb5f5d0356fe91e6428cb8b31d6a1441054fa3c9796523"
    else
      url "https://dist.inference.sh/cli/v1.17.7/inferencesh-cli-v1.17.7-darwin-amd64.tar.gz"
      sha256 "bd544fd58086b4999104252594cd7952a6546ec83e3a46097562be98f403e485"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.7/inferencesh-cli-v1.17.7-linux-arm64.tar.gz"
      sha256 "a109e70e3a8f0a6dfcdf55c9be72ccfb41565b7d9a247e734494b2abda752401"
    else
      url "https://dist.inference.sh/cli/v1.17.7/inferencesh-cli-v1.17.7-linux-amd64.tar.gz"
      sha256 "23a49a40d164ec33f6a05fb28e1751a730520114fd0cff089d50b38cb3585177"
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
