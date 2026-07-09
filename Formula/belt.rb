class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.14.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.15/inferencesh-cli-v1.14.15-darwin-arm64.tar.gz"
      sha256 "c681bf08e5fb2796f13d6045b2be9b47f39bc32cb9ef47108817debb75f5b3aa"
    else
      url "https://dist.inference.sh/cli/v1.14.15/inferencesh-cli-v1.14.15-darwin-amd64.tar.gz"
      sha256 "c7500084f095e44e03c04ea19b86478ec6e508c8cc948612a5a1da7f1a916d43"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.15/inferencesh-cli-v1.14.15-linux-arm64.tar.gz"
      sha256 "c7033f5a6e7190c455b693a077b7f2122eb760aadc8f8b82b48a1b6c3c5c220b"
    else
      url "https://dist.inference.sh/cli/v1.14.15/inferencesh-cli-v1.14.15-linux-amd64.tar.gz"
      sha256 "bc297ed5958be3720570e7267bbe0c87b612797cec8d1cd313c286605deead5b"
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
