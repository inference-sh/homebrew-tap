class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.16-darwin-arm64.tar.gz"
      sha256 "9e208af2f6fed121fbf9ff292e69e9d193d146fe95bdd2006b797c6f4ae03eea"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.16-darwin-amd64.tar.gz"
      sha256 "9dde3e25ecbe4c425dfe8ba1bf9b1cd8160faaee056b32eca21284a4f5d391ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.16-linux-arm64.tar.gz"
      sha256 "8c9ac995ab2e8375623e7e21a68a8be229b8377cf30cb87f96384e40066946bc"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.16-linux-amd64.tar.gz"
      sha256 "c35a59d719c3d0bb80454b049732d820c79677fd7b29471fee1331049db692bf"
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
