class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.14/inferencesh-cli-v1.29.14-darwin-arm64.tar.gz"
      sha256 "cdd11c6ce70f0faaf8a1dd682d9b8706ac8659d39bbb912f44b440601b83fd06"
    else
      url "https://dist.inference.sh/cli/v1.29.14/inferencesh-cli-v1.29.14-darwin-amd64.tar.gz"
      sha256 "a6da8864ae8843c815d84a94b53e2631655a0a9baa403eb5084c0d8b8bf08d6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.14/inferencesh-cli-v1.29.14-linux-arm64.tar.gz"
      sha256 "e4f50ccebeb3da69c2168912a0b9ee5fdef5242fdfa024c2f16de79937e9a9f0"
    else
      url "https://dist.inference.sh/cli/v1.29.14/inferencesh-cli-v1.29.14-linux-amd64.tar.gz"
      sha256 "f326ed8b90878ba7140826161418c4bfc7b458747bc27f9648e97bc4bd838e80"
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
