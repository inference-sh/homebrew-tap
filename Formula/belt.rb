class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.18/inferencesh-cli-v1.17.18-darwin-arm64.tar.gz"
      sha256 "35b4534826ac833ad53970c72d00352e7c524726880f760fca02f8679e68e6a9"
    else
      url "https://dist.inference.sh/cli/v1.17.18/inferencesh-cli-v1.17.18-darwin-amd64.tar.gz"
      sha256 "dce62fea198d92448574da7e47508f73e30800ef2e208758f4194f93d1fb32c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.18/inferencesh-cli-v1.17.18-linux-arm64.tar.gz"
      sha256 "18ca7acdcb04e7e5daf64132204aa49837be9f4411d158cbe0fc3d25b395e210"
    else
      url "https://dist.inference.sh/cli/v1.17.18/inferencesh-cli-v1.17.18-linux-amd64.tar.gz"
      sha256 "0c554e984c20fb78ba79d2b8d38eb15becdbabfdae2d051b8ba4bce1ec4f1dd8"
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
