class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.33-darwin-arm64.tar.gz"
      sha256 "2cdf0ee0353d36606471e8e149d879ed8456fb5ced28674fa9a80e39cd4f5df2"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.33-darwin-amd64.tar.gz"
      sha256 "566bee4ad4d372602bc0d5fb3774ad289e28e25f551077255107c21bac0a3db2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.33-linux-arm64.tar.gz"
      sha256 "3f0ba344583d7e775b755f9d4fc77972c25689ae132dfa2d3a4060cc952a04cf"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.33-linux-amd64.tar.gz"
      sha256 "53c6dd8acbff5516e515198bb6468a8602949ffb63584dd899e89f3f8be802dd"
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
