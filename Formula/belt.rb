class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.9-darwin-arm64.tar.gz"
      sha256 "e59dc32524ed01f3a81d930970a6604b07146326065e13485dcdedae40d5cdc6"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.9-darwin-amd64.tar.gz"
      sha256 "b2c8aa69762c616ed0da92a2e7f0af462c260f540250d62f26a6fef1b4ef3dc7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.9-linux-arm64.tar.gz"
      sha256 "d6ee13e4d033888b5b70e8c1c8d7675839588a165d0a4fa4c91352697ab59ea4"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.9-linux-amd64.tar.gz"
      sha256 "56ae4bc6515f3d47101b07cb1fb320092156a7f2d7357a8a098a8d2278c25028"
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
