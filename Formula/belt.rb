class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.9-darwin-arm64.tar.gz"
      sha256 "3507c9fdb74d6e5029c5bbe049ce800d28b7a3724c581cc9c387820bf50b4030"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.9-darwin-amd64.tar.gz"
      sha256 "69fca92618be70a53a09c1b6bd65ea2223e5fe433156d48fc1ee280812d33263"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.9-linux-arm64.tar.gz"
      sha256 "612a8bdc944f07facd2cd609bf0c005ac7cad7e9bca893164ed4e7e191f5ed0b"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.9-linux-amd64.tar.gz"
      sha256 "6589a2004b13033fd0a3b2dd120b022d2835f647eff4f4cb67c215e01ae88db9"
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
