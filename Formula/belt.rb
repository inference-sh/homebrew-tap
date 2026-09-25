class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.64"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.64/inferencesh-cli-v1.18.64-darwin-arm64.tar.gz"
      sha256 "8cac1ce04e4bb3203d0eb62c61ec251fd6620818ca88f803039ce13deabfe400"
    else
      url "https://dist.inference.sh/cli/v1.18.64/inferencesh-cli-v1.18.64-darwin-amd64.tar.gz"
      sha256 "920554d8643721a85eef74d820ba11cb4d2f04ae0c1ab0e05e21f55a6df8344b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.64/inferencesh-cli-v1.18.64-linux-arm64.tar.gz"
      sha256 "dad022a747d8ac1dd0ecec4c984a09117b590c63374831d98892ddd0ebbdfb24"
    else
      url "https://dist.inference.sh/cli/v1.18.64/inferencesh-cli-v1.18.64-linux-amd64.tar.gz"
      sha256 "874730a7ef6e65a0767bcde28d63c13a1465441a2b59bbece192727cd8e30e46"
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
