class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.5/inferencesh-cli-v1.19.5-darwin-arm64.tar.gz"
      sha256 "53456e69e1309dd7ac33a674541bc65f2ddbddae1ab515ac3faa009f49d56503"
    else
      url "https://dist.inference.sh/cli/v1.19.5/inferencesh-cli-v1.19.5-darwin-amd64.tar.gz"
      sha256 "5820fb53cfaa2044f1d1fd656522c7358cdc84fdefafa2a066e84cf94c0b36cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.5/inferencesh-cli-v1.19.5-linux-arm64.tar.gz"
      sha256 "cab24afd20640cf0c51f3a86c47879002230953d86bb57d537cd445cb1dff6df"
    else
      url "https://dist.inference.sh/cli/v1.19.5/inferencesh-cli-v1.19.5-linux-amd64.tar.gz"
      sha256 "bf8ac6df568f291fcbbc8a91b33967e736aa86d0720434b586c7e0584d67d6bd"
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
