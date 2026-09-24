class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.63"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.63/inferencesh-cli-v1.18.63-darwin-arm64.tar.gz"
      sha256 "12cfa50762ddb4c56249728b619c4da041f06db30622a1b09f369e1b7796bcbc"
    else
      url "https://dist.inference.sh/cli/v1.18.63/inferencesh-cli-v1.18.63-darwin-amd64.tar.gz"
      sha256 "2ef261531f9aa4f3e987db10f87b583c30d5cd2ac4bf6225a6e7a9f86aeb59bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.63/inferencesh-cli-v1.18.63-linux-arm64.tar.gz"
      sha256 "a74574396f79c52e49657ca5f1b368a5c32f9b211116386c17d97e72fa9e64a5"
    else
      url "https://dist.inference.sh/cli/v1.18.63/inferencesh-cli-v1.18.63-linux-amd64.tar.gz"
      sha256 "1181e5ad6a898fe4f9ca8039b3888133876ae404b8df30cba7f6e9599d9c80fa"
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
