class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.14/inferencesh-cli-v1.19.14-darwin-arm64.tar.gz"
      sha256 "1f924abb7f26d9a43b6a22ef5ba58e62a34710f2a126fc45d7101b55a7f3c001"
    else
      url "https://dist.inference.sh/cli/v1.19.14/inferencesh-cli-v1.19.14-darwin-amd64.tar.gz"
      sha256 "64d29f2c5e4a5fcfca3a0c6c61ed2f475276d86fb1743cee7f177cdf496e9a8d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.14/inferencesh-cli-v1.19.14-linux-arm64.tar.gz"
      sha256 "e3b046a1b60db28c85ff6ce0f8d31c25fc5ff93ad645046273e8154bc87c06ba"
    else
      url "https://dist.inference.sh/cli/v1.19.14/inferencesh-cli-v1.19.14-linux-amd64.tar.gz"
      sha256 "a2c7f921fa1fb56c92543937f72141dae9a52128f475a7aa941c7f0ee10f910e"
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
