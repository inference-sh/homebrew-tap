class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.18-darwin-arm64.tar.gz"
      sha256 "eac9118017e1a54f482f1fb33386b227fdda91a810de7759f72363c26f4d0287"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.18-darwin-amd64.tar.gz"
      sha256 "13268b96816c24b20d976ea3c07e484168bbf946ad823a81c9c68027eaf74b9f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.18-linux-arm64.tar.gz"
      sha256 "00187143e9b078780be09d2b4d2ae1ecadabc4716a999ca504ef68d7a596507a"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.18-linux-amd64.tar.gz"
      sha256 "c4d2b5c8a89b0e8c908416869a55a89e2845707c76aa3a992e6bc9ccab1411ab"
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
