class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.18/inferencesh-cli-v1.18.18-darwin-arm64.tar.gz"
      sha256 "5d897cfe6c23313f556f02eaec88af09fa144f6c97bf18b82bf842b1ce9a071c"
    else
      url "https://dist.inference.sh/cli/v1.18.18/inferencesh-cli-v1.18.18-darwin-amd64.tar.gz"
      sha256 "5e1f6aa3b8ac2b45302cf37e2b80a3f05ad3ca1922a279246c338e09b87d0390"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.18/inferencesh-cli-v1.18.18-linux-arm64.tar.gz"
      sha256 "2fd6e29c128a1159e3a19ef1de42ff1796a0a4f1d9252cdf89f1c4a4f5efbf02"
    else
      url "https://dist.inference.sh/cli/v1.18.18/inferencesh-cli-v1.18.18-linux-amd64.tar.gz"
      sha256 "34629faaea80cc8915c0d988792541f7f38c50a5be9dc962e3bf93487a10a0da"
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
