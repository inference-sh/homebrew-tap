class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.14.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.14/inferencesh-cli-v1.14.14-darwin-arm64.tar.gz"
      sha256 "e87020239d1426ccbc9b3b64732545fdd45d30a526bd190958642e69f1a5f777"
    else
      url "https://dist.inference.sh/cli/v1.14.14/inferencesh-cli-v1.14.14-darwin-amd64.tar.gz"
      sha256 "b1a19068da97b641d9b866fc731862c63147bf656bcb2379db475a67467b3ed5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.14/inferencesh-cli-v1.14.14-linux-arm64.tar.gz"
      sha256 "d3792e6df8feef817f37bd6c8b12f2efbdd3e362ab55f11854ae2e75abe67f77"
    else
      url "https://dist.inference.sh/cli/v1.14.14/inferencesh-cli-v1.14.14-linux-amd64.tar.gz"
      sha256 "676df2926f88151fcdbdf976c7556890bcaec8b7bcdfd9db1b6d359953af5650"
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
