class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.47"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.47/inferencesh-cli-v1.18.47-darwin-arm64.tar.gz"
      sha256 "a383e9b9cc672176d819f86341a6ae69023d395645b3dbe5c935d3a795681400"
    else
      url "https://dist.inference.sh/cli/v1.18.47/inferencesh-cli-v1.18.47-darwin-amd64.tar.gz"
      sha256 "36581e3a8f8bb9ce1875f42dd9ae1a8c06a8055dbf6f74748a1184b560c2a844"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.47/inferencesh-cli-v1.18.47-linux-arm64.tar.gz"
      sha256 "5267619af3efc8404a6aab96ea4471bb26ae8502d22facd7be14c945be6a8917"
    else
      url "https://dist.inference.sh/cli/v1.18.47/inferencesh-cli-v1.18.47-linux-amd64.tar.gz"
      sha256 "d9cf5f2b3dd2275a6b4b08265fe7e25916e345d48728f3b4ceadbd8005112d33"
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
