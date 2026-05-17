class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.9-darwin-arm64.tar.gz"
      sha256 "ba40106baf871cd1d1ad520b7cbed2347715c81b4fdc6e8cb82b8201884e7987"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.9-darwin-amd64.tar.gz"
      sha256 "8034185eaae5f94580aa6d2344edf5c91ae24fc54ddd4561433dba0c1005a0bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.9-linux-arm64.tar.gz"
      sha256 "74a966ba03b26fac3cad2b426c50e38e30f5c38d4c98d00ba9eeda7c2290abed"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.9-linux-amd64.tar.gz"
      sha256 "fe8828014ad3786935625804042905cfe2fdf5dfdcab306e1993c2679e77e3f2"
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
