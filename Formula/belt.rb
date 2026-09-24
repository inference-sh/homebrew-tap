class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.62"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.62/inferencesh-cli-v1.18.62-darwin-arm64.tar.gz"
      sha256 "052b4836d8a5c5d8428c2bd31d09686573b1556e5aad71bc6bc6e2ce260d066c"
    else
      url "https://dist.inference.sh/cli/v1.18.62/inferencesh-cli-v1.18.62-darwin-amd64.tar.gz"
      sha256 "db307c319e43f503b4a7f410865985b370ada0e73ecb7b74a03c5c8f92dd508a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.62/inferencesh-cli-v1.18.62-linux-arm64.tar.gz"
      sha256 "0b35c02196d27d8215cb2839c98d4f587d9f03835254a9d270e70278c13c3c64"
    else
      url "https://dist.inference.sh/cli/v1.18.62/inferencesh-cli-v1.18.62-linux-amd64.tar.gz"
      sha256 "da6bea5968ddbc20c1388f81dc81d70eb790d774df511ade5a1f2f397adbcb48"
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
