class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.28/inferencesh-cli-v1.15.28-darwin-arm64.tar.gz"
      sha256 "a54cb43a9c8365071a1fca59d75b1c3f2ae1bffc34b57947d21747e647ebb0aa"
    else
      url "https://dist.inference.sh/cli/v1.15.28/inferencesh-cli-v1.15.28-darwin-amd64.tar.gz"
      sha256 "a174e4ff809846766c42cd46f2946d88de056a90c5eabc831555f51987468f88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.28/inferencesh-cli-v1.15.28-linux-arm64.tar.gz"
      sha256 "a2da86148fb9c049a740d96c6672e6152fb5d2c42ae01a0f9df690f78246e3c7"
    else
      url "https://dist.inference.sh/cli/v1.15.28/inferencesh-cli-v1.15.28-linux-amd64.tar.gz"
      sha256 "565461af03f7f201c0967fee0d481ca15993d26a4cdd003a1c897f8d9fa62dc2"
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
