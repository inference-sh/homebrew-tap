class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.7/inferencesh-cli-v1.15.7-darwin-arm64.tar.gz"
      sha256 "5b0ea794f7ea49a6882abf60fd8a7a379d3718f1b3c81fcd2add5d7f618e8f3f"
    else
      url "https://dist.inference.sh/cli/v1.15.7/inferencesh-cli-v1.15.7-darwin-amd64.tar.gz"
      sha256 "8a1b7303fa0e268e95eb42ea0a009035041d0149449433ac94a9e0bba0320e37"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.7/inferencesh-cli-v1.15.7-linux-arm64.tar.gz"
      sha256 "f720d2d0a6da5cfa5b5da766cb61a2bcd52bf44e37ec69064e5c7f84f44f2aa3"
    else
      url "https://dist.inference.sh/cli/v1.15.7/inferencesh-cli-v1.15.7-linux-amd64.tar.gz"
      sha256 "639679dc57728e3b03b8af981c22c35eec9b3cf60dbc843ac8b620b141f407ef"
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
