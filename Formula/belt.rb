class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.30"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.30/inferencesh-cli-v1.15.30-darwin-arm64.tar.gz"
      sha256 "ee084678a7e5b0a09eead84f4986fc3d28c6e6e0ce63032589304160e85578ff"
    else
      url "https://dist.inference.sh/cli/v1.15.30/inferencesh-cli-v1.15.30-darwin-amd64.tar.gz"
      sha256 "019961ce6b7113f68d4e2f95ae5ab0b849beced521244286b88d2cb5d06aa28c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.30/inferencesh-cli-v1.15.30-linux-arm64.tar.gz"
      sha256 "8108c3ca94e6ddacdd7c83d4befc184dad20365ade34a7fe62ec6ecadb26a77f"
    else
      url "https://dist.inference.sh/cli/v1.15.30/inferencesh-cli-v1.15.30-linux-amd64.tar.gz"
      sha256 "cac9d199fb5bd0c81476329a6e411ca3ca73eab347753c8d0f9569422e9e2eef"
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
