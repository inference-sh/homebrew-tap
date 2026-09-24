class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.60"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.60/inferencesh-cli-v1.18.60-darwin-arm64.tar.gz"
      sha256 "7e605000f41f005af64c1d58d051edec0ba03f31858f230a10e0c612aec4de03"
    else
      url "https://dist.inference.sh/cli/v1.18.60/inferencesh-cli-v1.18.60-darwin-amd64.tar.gz"
      sha256 "2b6b397b1a5b5b1aab84ab22b13173c226c3264386d2f0bdd0ac687dae9f0682"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.60/inferencesh-cli-v1.18.60-linux-arm64.tar.gz"
      sha256 "53b9187e2846a66290826f5ba96a16e32f86e6f55e151e20974a0fdea86f42fc"
    else
      url "https://dist.inference.sh/cli/v1.18.60/inferencesh-cli-v1.18.60-linux-amd64.tar.gz"
      sha256 "3f0a96c28428fc654a47f8bfbcc1e71e1b857004a55fd4de20c5d7d4cd236c04"
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
