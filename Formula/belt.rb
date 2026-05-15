class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.17-darwin-arm64.tar.gz"
      sha256 "324241d37e0400d3bcdf1ee7e132dc8f774ba33da9ae5d09e7bacc0198701e91"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.17-darwin-amd64.tar.gz"
      sha256 "226bacd074ae8f7117d408596cf332cb46f100b1510eafdbf5cefb697d1cd6cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.17-linux-arm64.tar.gz"
      sha256 "6d7a48c3300de470b1c540da8c1947f256bb5ceafa9274aaa61fda6ebdae6760"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.17-linux-amd64.tar.gz"
      sha256 "48b6111ae89534a3c30a83f68319bb9d71d7bb78e9d4b87d27aad2f35e761298"
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
