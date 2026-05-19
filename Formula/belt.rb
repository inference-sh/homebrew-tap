class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.34-1-g84c1674"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.34-1-g84c1674-darwin-arm64.tar.gz"
      sha256 "41f3fb30fd3d64c7376b3fad7bc2d1176da9705b54a2f7e687db47ecbbbe8d13"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.34-1-g84c1674-darwin-amd64.tar.gz"
      sha256 "e46baa803d6a5ef801360975b1de8169d66f3d0982419d70c3d94ed75992d887"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.34-1-g84c1674-linux-arm64.tar.gz"
      sha256 "021f85c3d6de531a6c0eff6dde0cc9a1e5f4abf6c81aadab9175b6338647c6bc"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.34-1-g84c1674-linux-amd64.tar.gz"
      sha256 "2603df40d6da79086465ba52b8ca51fbf339d48a9afba8b580b13bd1b2752c22"
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
