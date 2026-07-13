class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.2/inferencesh-cli-v1.15.2-darwin-arm64.tar.gz"
      sha256 "01f0de42f9e75b0a6a3aeba6e29832c44962b9f4d5895d0ca48bc75297a3099f"
    else
      url "https://dist.inference.sh/cli/v1.15.2/inferencesh-cli-v1.15.2-darwin-amd64.tar.gz"
      sha256 "59174cda5f957e2c98b9972506b17172082fcf231ea8a7e941824a603b502ad7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.2/inferencesh-cli-v1.15.2-linux-arm64.tar.gz"
      sha256 "8a98ef89b6d87e356f6a6f78c1cadf24694892e1d02a5f5aa724fc1c93c54720"
    else
      url "https://dist.inference.sh/cli/v1.15.2/inferencesh-cli-v1.15.2-linux-amd64.tar.gz"
      sha256 "20ea48b1a553dfbced3b4a9e30354bdf4c2cd430c29669ee518be9fa88a42b06"
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
