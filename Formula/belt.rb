class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.14.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.18/inferencesh-cli-v1.14.18-darwin-arm64.tar.gz"
      sha256 "0dbae114d638e42a486a29551366e2271101095353c91b91b77500b182fe9150"
    else
      url "https://dist.inference.sh/cli/v1.14.18/inferencesh-cli-v1.14.18-darwin-amd64.tar.gz"
      sha256 "f3e17581e5f914199ae22b3890350ce3d25b8d63e55562f102a1b7cbcb4bbcf9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.18/inferencesh-cli-v1.14.18-linux-arm64.tar.gz"
      sha256 "95f9f93bd50552e407e2e7c9aa01ac654e89f7f97e2dd9abb4bdfd7233341e4c"
    else
      url "https://dist.inference.sh/cli/v1.14.18/inferencesh-cli-v1.14.18-linux-amd64.tar.gz"
      sha256 "8c3face63eaa5a77ca93a136362a4f416b3225abe0406749c703e76f4e9f9f5b"
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
