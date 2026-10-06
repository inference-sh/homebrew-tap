class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.17/inferencesh-cli-v1.19.17-darwin-arm64.tar.gz"
      sha256 "7b08124ab95af3748bb136bc81b66f038e9d464a1b38130d73c2372774b7e262"
    else
      url "https://dist.inference.sh/cli/v1.19.17/inferencesh-cli-v1.19.17-darwin-amd64.tar.gz"
      sha256 "5172a325a1c5db91b489a19e5999b7d3670eb390314bb14d839b3d7eb4d3104e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.17/inferencesh-cli-v1.19.17-linux-arm64.tar.gz"
      sha256 "c6b1e640fae90fd7796bcbf5643e7216e83a33d2cb7421f03f9fa192a8ba69a0"
    else
      url "https://dist.inference.sh/cli/v1.19.17/inferencesh-cli-v1.19.17-linux-amd64.tar.gz"
      sha256 "df10a9daf6a0756d784b381e2b58558dd264421e25354a1cdcd7ca1021e8c777"
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
