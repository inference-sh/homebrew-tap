class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.12/inferencesh-cli-v1.29.12-darwin-arm64.tar.gz"
      sha256 "2bbd6abdb29a2cf6ffdef0437068f0a9dfa3e768408443f9e3d9c25a4b711be5"
    else
      url "https://dist.inference.sh/cli/v1.29.12/inferencesh-cli-v1.29.12-darwin-amd64.tar.gz"
      sha256 "ec6071d29c969856b8a1c92af7c6a30fc22ce080353b6e029ef1017d6adf41dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.12/inferencesh-cli-v1.29.12-linux-arm64.tar.gz"
      sha256 "9cc73ae7e2dbe29641016b4b7d045e016333d5b572b324ffc9141f9d8a4d3164"
    else
      url "https://dist.inference.sh/cli/v1.29.12/inferencesh-cli-v1.29.12-linux-amd64.tar.gz"
      sha256 "f4b335d7bbe96d221efa419a31ac4bd966ac195293c23e7f8e02545d91ffa9e9"
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
