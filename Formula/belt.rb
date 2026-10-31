class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.10/inferencesh-cli-v1.28.10-darwin-arm64.tar.gz"
      sha256 "e8d94bbc0dc24873c772e01ad32abbaf39fc3582e74187ada3fbd54b2c0bf5fe"
    else
      url "https://dist.inference.sh/cli/v1.28.10/inferencesh-cli-v1.28.10-darwin-amd64.tar.gz"
      sha256 "b94ccbff3e8e3ec4a926c96130823fe29ff13c06b7f92a74219423de4e102ede"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.10/inferencesh-cli-v1.28.10-linux-arm64.tar.gz"
      sha256 "ae449008e7794d9a52e60a79a2723106124f4de4e9110041522c8efbb096645c"
    else
      url "https://dist.inference.sh/cli/v1.28.10/inferencesh-cli-v1.28.10-linux-amd64.tar.gz"
      sha256 "5e6a0d02e701c0b37a563fddcae69d0a2da97517d3ef45f070a09b86595eb757"
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
