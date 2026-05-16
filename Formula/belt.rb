class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.6-darwin-arm64.tar.gz"
      sha256 "1be5c960930248c5c3ef41b14cf1ab050e70921357fd17c6b834b0a5a33249f8"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.6-darwin-amd64.tar.gz"
      sha256 "479d61cca46ed17bce27de3699cb6805914f09c599b004ccc6e01651ea2d3c1a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.6-linux-arm64.tar.gz"
      sha256 "68ba05a215eb579ec6d3eb295d326674ca59f1746c675aeda9acedba3bdf4f96"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.6-linux-amd64.tar.gz"
      sha256 "ac59c49a81ce65486287db4b4c82f9362c353813990a6be4856acad7e3415968"
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
