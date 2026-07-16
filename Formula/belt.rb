class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.8/inferencesh-cli-v1.15.8-darwin-arm64.tar.gz"
      sha256 "4bfa933dca4d2e1008110736bea000bd3c49a4f749bfaec55c6addfa5089ace7"
    else
      url "https://dist.inference.sh/cli/v1.15.8/inferencesh-cli-v1.15.8-darwin-amd64.tar.gz"
      sha256 "5248f3f6c7d9083679060c00ec6d98689217789cdf7e4085cba171ea248bf4fd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.8/inferencesh-cli-v1.15.8-linux-arm64.tar.gz"
      sha256 "fa6d6d02fae59fe89062300e92ef1365ed91f065db41afafc0a9c4e6e738c518"
    else
      url "https://dist.inference.sh/cli/v1.15.8/inferencesh-cli-v1.15.8-linux-amd64.tar.gz"
      sha256 "ea7d9d1a5dcf42ab062f9d4f2db475650e2b10f37ca19c044f29b9618ceb7e36"
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
