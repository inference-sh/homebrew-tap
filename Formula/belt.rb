class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.2/inferencesh-cli-v1.29.2-darwin-arm64.tar.gz"
      sha256 "662aa57c84a9bb63697feb680cca5c0ec3039a482f760414f6cdab3d8a10f483"
    else
      url "https://dist.inference.sh/cli/v1.29.2/inferencesh-cli-v1.29.2-darwin-amd64.tar.gz"
      sha256 "292d05e6dddeb350d2030d2591b68ceb3d4a28d3f35453f2a066a45c88feb02d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.2/inferencesh-cli-v1.29.2-linux-arm64.tar.gz"
      sha256 "8c4f7a193f19b769dace47932ef809e2c3772a9e8d2ca38a847b4d5ecbb32689"
    else
      url "https://dist.inference.sh/cli/v1.29.2/inferencesh-cli-v1.29.2-linux-amd64.tar.gz"
      sha256 "c693b74f223d605f813e6008fe69ae7fc5bb0c2213834c41eb0b273f32ad764b"
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
