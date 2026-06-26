class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.14.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.5-darwin-arm64.tar.gz"
      sha256 "f740c862e7ff1f7fa0a0af7e7cf97adcb8f28059901b7731ad550e029ce6f602"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.5-darwin-amd64.tar.gz"
      sha256 "33b4a2ddd78297a6505f24cfa65be191e3ec9e4ec18b734e87440ea0cd0329a4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.5-linux-arm64.tar.gz"
      sha256 "bf643893a7ba47efb785d51cd198c688e1efb7d28f5f65ce5d0c4eb47fd1cee8"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.5-linux-amd64.tar.gz"
      sha256 "6e5a640594ac5eaf55296aec6a1924232d65e939f49170d01bde475d3fb25ff1"
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
