class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.19/inferencesh-cli-v1.29.19-darwin-arm64.tar.gz"
      sha256 "2d708ba3d99934559df637259fa4fc6d201a35d0c746e41c04cfeee6937096e8"
    else
      url "https://dist.inference.sh/cli/v1.29.19/inferencesh-cli-v1.29.19-darwin-amd64.tar.gz"
      sha256 "f0889527b8da34b15c5d7d27adfe8d08aa6c035fe9b6a3530b5686e86dc264cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.19/inferencesh-cli-v1.29.19-linux-arm64.tar.gz"
      sha256 "ab45060df6ef360fda035b689286b7b9abe8bed8f3121c399ae1d1fba9c6b94c"
    else
      url "https://dist.inference.sh/cli/v1.29.19/inferencesh-cli-v1.29.19-linux-amd64.tar.gz"
      sha256 "fc78ad221501ced0fcb1e52ed16c407fd75e3d13875b3485f419f4d823330eee"
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
