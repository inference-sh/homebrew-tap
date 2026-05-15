class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.18-darwin-arm64.tar.gz"
      sha256 "eb29e40c05589baeed4007a652a6aaaf0408736a5798a44f64fe06c48d2e0608"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.18-darwin-amd64.tar.gz"
      sha256 "f746a18ce70e604d8e0b02b4a51cfc1207374581a0f4a49b5d01d4813dd1ee8c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.18-linux-arm64.tar.gz"
      sha256 "59b98cffc5e591343c8b2f8eb45e42939e932f7cfcacbc4ecbc932b5cb323f4d"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.18-linux-amd64.tar.gz"
      sha256 "f02fcc2ca31de84308f9630db8969281f1c35dd61892a3d489a5cfc3ade25f36"
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
