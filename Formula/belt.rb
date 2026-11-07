class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.20/inferencesh-cli-v1.28.20-darwin-arm64.tar.gz"
      sha256 "a70a94c3eb13f2a42eb00f36dfad011ef2fbc2e686640c0783b8fb66b31ea1fd"
    else
      url "https://dist.inference.sh/cli/v1.28.20/inferencesh-cli-v1.28.20-darwin-amd64.tar.gz"
      sha256 "910b227b4b731a826282747481336cf5e74c8d4dac8ddf32c4441926fdb0e66b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.20/inferencesh-cli-v1.28.20-linux-arm64.tar.gz"
      sha256 "78a4af864bd7fb730b4d308987a1cdbeb3130444dcf8097989bdfff03bbd037a"
    else
      url "https://dist.inference.sh/cli/v1.28.20/inferencesh-cli-v1.28.20-linux-amd64.tar.gz"
      sha256 "4b960de4f23b6d41f6dc5af3723474eb15c2d3a4973beb525341bb295034a61a"
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
