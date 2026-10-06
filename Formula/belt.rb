class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.20/inferencesh-cli-v1.19.20-darwin-arm64.tar.gz"
      sha256 "029fab99d69ab8a1124b89dd5af51ad3b5db80421c0f336f27cfc54b7eac9a2e"
    else
      url "https://dist.inference.sh/cli/v1.19.20/inferencesh-cli-v1.19.20-darwin-amd64.tar.gz"
      sha256 "6b7086651fb352391bdc94559b4b9da5cf043c57c63030bc8e04ac21d87a3cb2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.20/inferencesh-cli-v1.19.20-linux-arm64.tar.gz"
      sha256 "a87a3fc46d70ce0e408b1a859a4c076867779b8068a46b9e35be4a08ae61549f"
    else
      url "https://dist.inference.sh/cli/v1.19.20/inferencesh-cli-v1.19.20-linux-amd64.tar.gz"
      sha256 "b710786bb2a69d1a1224d484e23296687019870fba30e2d85fe2540998def78b"
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
