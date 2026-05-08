class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.14-darwin-arm64.tar.gz"
      sha256 "7504c1ccf2527f65e799b355d1125de32629c536a5fdfa5092dff5a4e99a7bad"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.14-darwin-amd64.tar.gz"
      sha256 "4d419a237b4c0e0cf7f1fb36b4c84bb3931b3d36f505ea15ae242e330701940e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.14-linux-arm64.tar.gz"
      sha256 "a7f5935139cc63161519e45eba6062f1f878d868b4d5b5d6d75c2971683deee7"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.14-linux-amd64.tar.gz"
      sha256 "9841ce76c62991d1040789cb04ec3dba71f6c4ffac7476561cb0434b89b4c889"
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
