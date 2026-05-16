class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.20-darwin-arm64.tar.gz"
      sha256 "75664cc1d52ea7f16dd62a6a28742a6dc2706df95a7614c60b31ef3b3b2ec070"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.20-darwin-amd64.tar.gz"
      sha256 "a248c1c89c09c3cc66b200eba9ee1a267389ae6b796448343475cbdeab6e0f46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.20-linux-arm64.tar.gz"
      sha256 "4bacc3219f80d445c6eea703933e78105fd08af28b5379d1404ee4b57cb3683e"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.20-linux-amd64.tar.gz"
      sha256 "d477b2fff81cbd1fe6a931f293beb33f499e1834a24189c8f9877482cf804003"
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
