class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-vv1.9.6-darwin-arm64.tar.gz"
      sha256 "d02af8054b40d403bea1f0c15b4206c5ada6a106fc1a84384ec8f35674b5c393"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-vv1.9.6-darwin-amd64.tar.gz"
      sha256 "35a26958cf3aca233a554042db6999da1ee6ad6f2b57706eab002c902c7439f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-vv1.9.6-linux-arm64.tar.gz"
      sha256 "dd9bed019eb31d90726fe4c655bd5de6ac7c5b55ccd245680b458f08b815af4f"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-vv1.9.6-linux-amd64.tar.gz"
      sha256 "87f7a4f606531f86d9d13e15c79dee33f968c116873e1807d1c778d179d33cd9"
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
