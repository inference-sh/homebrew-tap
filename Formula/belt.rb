class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.7-darwin-arm64.tar.gz"
      sha256 "ec98c819a410af1717d6528dcba9f085e005fb4756e16985dfb2e1390f7fab2d"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.7-darwin-amd64.tar.gz"
      sha256 "2f2b1c5715bf44de4154cba8b245dee97c6da39859319f1c96e94f100b765d2f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.7-linux-arm64.tar.gz"
      sha256 "0e953d0534bdc86681568286a6259d073b0ca37a8fb9c48982286c4655dcd191"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.7-linux-amd64.tar.gz"
      sha256 "c5d9eaf191e7110b40c3884b2b2f31ccdb834aa2a223b413d4f44eee6536e4a3"
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
