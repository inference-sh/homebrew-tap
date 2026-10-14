class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.6/inferencesh-cli-v1.25.6-darwin-arm64.tar.gz"
      sha256 "f292aa623568d0616da290e7231b2cf6baa898763fbd4850e0749ff3e3cd0bdd"
    else
      url "https://dist.inference.sh/cli/v1.25.6/inferencesh-cli-v1.25.6-darwin-amd64.tar.gz"
      sha256 "8cb18d440c28926fd2f2ebeff2dc526b2be524d783bdfe6a5294ab20d2a0b02f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.6/inferencesh-cli-v1.25.6-linux-arm64.tar.gz"
      sha256 "3eb50060a571c9dc2b6542ea96abae79d0baac9e941fb9be82230cd80d18fe3c"
    else
      url "https://dist.inference.sh/cli/v1.25.6/inferencesh-cli-v1.25.6-linux-amd64.tar.gz"
      sha256 "892abf61965318212f53136495662d864d76c4d8ab21512c2bf24fb0c5908131"
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
