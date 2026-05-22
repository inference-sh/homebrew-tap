class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.9-darwin-arm64.tar.gz"
      sha256 "6b9040d0a08266cee527642ce68019cc9600cf81ca7a6b46b03faf16f6725117"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.9-darwin-amd64.tar.gz"
      sha256 "2aba69baed2d520e40b34fc2ba2b19009379a46471b5ba9768458319ad88ab6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.9-linux-arm64.tar.gz"
      sha256 "fe4098ac801bc49ec12c3d04b3fabfeadf547e8cfb265cea821f43c88c8514f8"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.9-linux-amd64.tar.gz"
      sha256 "01e6dad442cde92ddc272180052ea74f268778229a9950c65a24893ac85aaa79"
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
