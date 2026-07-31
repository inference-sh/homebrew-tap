class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.13/inferencesh-cli-v1.16.13-darwin-arm64.tar.gz"
      sha256 "f993437a6596bbd3ed97be1422d395502ee2b2b39d8003442ada253f25c3e8ef"
    else
      url "https://dist.inference.sh/cli/v1.16.13/inferencesh-cli-v1.16.13-darwin-amd64.tar.gz"
      sha256 "3a793d5f767531937e043360e508bc18059b6f215ae4e78aabf6feb78bbc9f41"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.13/inferencesh-cli-v1.16.13-linux-arm64.tar.gz"
      sha256 "ab96f358e9196d8832ab484c7f193c92f10c66e91230b446fa2b1b154342a586"
    else
      url "https://dist.inference.sh/cli/v1.16.13/inferencesh-cli-v1.16.13-linux-amd64.tar.gz"
      sha256 "8532aa9daff3a117033af9b9e558237762f589022bee5c661527c2664701cbed"
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
