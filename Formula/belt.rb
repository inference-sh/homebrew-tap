class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.13-darwin-arm64.tar.gz"
      sha256 "46d07f96e999348f685b249a83c762ebd23b2aed4efca8b256892fbbcf16211a"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.13-darwin-amd64.tar.gz"
      sha256 "0321178f204d532647ee1097adf372eeebd6ae8c064b4f87f32889ca1f05c4d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.13-linux-arm64.tar.gz"
      sha256 "15dad3f198e696901296237041afdd41e3ca3c6719feadb31ae58dcb17fd0a68"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.13-linux-amd64.tar.gz"
      sha256 "2242e76536b60183e9d79b84e8dd69046962b1eef08555a231dc3b9088e9f7fc"
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
