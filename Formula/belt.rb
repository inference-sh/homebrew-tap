class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.12/inferencesh-cli-v1.17.12-darwin-arm64.tar.gz"
      sha256 "8c0c7a7b5f51782b7582205cc6b6b0d312a8e8375d2a4f1b5f164c60ae72b4c3"
    else
      url "https://dist.inference.sh/cli/v1.17.12/inferencesh-cli-v1.17.12-darwin-amd64.tar.gz"
      sha256 "d08de9cc7d34d5b8d3a199c61e3674b6a212839a663fde58c9f2d64c8a2e6fdb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.12/inferencesh-cli-v1.17.12-linux-arm64.tar.gz"
      sha256 "a7fd9a07976f4826b4d6914a98481b4ac3719fabc419e53e9fa4570e81e2edc0"
    else
      url "https://dist.inference.sh/cli/v1.17.12/inferencesh-cli-v1.17.12-linux-amd64.tar.gz"
      sha256 "f5aaeb8d23c6e1dc163daa0d52113e09efe6b06f8653c4e78c5315ab138672c9"
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
