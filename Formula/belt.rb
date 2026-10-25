class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.19/inferencesh-cli-v1.26.19-darwin-arm64.tar.gz"
      sha256 "3dc0daf7e025aff319635ce33466ec3649143ea1fbb75807d7af749424b2776a"
    else
      url "https://dist.inference.sh/cli/v1.26.19/inferencesh-cli-v1.26.19-darwin-amd64.tar.gz"
      sha256 "67d0a45abf1d090fb7cf7c88ca6002aac0bd9e13e390d996c11a30277fb7bf7d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.19/inferencesh-cli-v1.26.19-linux-arm64.tar.gz"
      sha256 "acd5ffd456b8f300936b27a915b7bbb2e2569954b2b5a0e79267a375b4e40e02"
    else
      url "https://dist.inference.sh/cli/v1.26.19/inferencesh-cli-v1.26.19-linux-amd64.tar.gz"
      sha256 "fbda7904c9a2ecc2ca4d710e8b565209b4320e20016eafab9438a6aba75fa9b9"
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
