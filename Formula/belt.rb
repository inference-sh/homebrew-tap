class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.35"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.35/inferencesh-cli-v1.28.35-darwin-arm64.tar.gz"
      sha256 "90d7f8fe9d475bc1d4f47ab65d4052e0ebb55bb9e2434d0651a31f18ff099eb3"
    else
      url "https://dist.inference.sh/cli/v1.28.35/inferencesh-cli-v1.28.35-darwin-amd64.tar.gz"
      sha256 "f672a51c02da81c5cf23ba5244c3169754377a147ce33373fb48257e1c6a58c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.35/inferencesh-cli-v1.28.35-linux-arm64.tar.gz"
      sha256 "c02e7a7a45133ace259836ebfa1a1c8d221432efb523036332b40ba7e86b4bde"
    else
      url "https://dist.inference.sh/cli/v1.28.35/inferencesh-cli-v1.28.35-linux-amd64.tar.gz"
      sha256 "e3a8f7b6d154ccdb10b6ef2014cd15d588868605e047067c225f7459d425428e"
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
