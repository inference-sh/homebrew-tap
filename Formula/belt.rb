class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.7-darwin-arm64.tar.gz"
      sha256 "08e2052b0acc64b308b4f9bbbe6bec7737391b09279c35c3c910c47dfa585fd5"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.7-darwin-amd64.tar.gz"
      sha256 "91655c33156d0808aee248e5873e63ab84872b5968ff611e49ee5b420bdd89a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.7-linux-arm64.tar.gz"
      sha256 "d3f691848a0c96932ba5616549cd2d0244ef807a30ea5deb529bcf44f3b4a191"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.7-linux-amd64.tar.gz"
      sha256 "62bed820506b8afd687fb52816ef53ca87150391dec8284dc65429d3d859dd34"
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
