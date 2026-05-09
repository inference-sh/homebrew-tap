class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.10.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.1-darwin-arm64.tar.gz"
      sha256 "929935b58c007ff065d7c67418a8350ad974071b0ca2c31250ea05c30252f1fd"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.1-darwin-amd64.tar.gz"
      sha256 "e99f93d1497d16acb6a76c2763b261ec4e556c21d77a135a73f8d457a2b8128c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.1-linux-arm64.tar.gz"
      sha256 "aba1876acf094e887713360cdb02d9779ccfd0cf7ce0b1607e06b46d6624ae68"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.1-linux-amd64.tar.gz"
      sha256 "1b1456f21414a1f6d2ad7276bba9422fbf6d3d5874d61cb2ef38e8c3d85fa5d7"
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
