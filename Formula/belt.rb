class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.12/inferencesh-cli-v1.15.12-darwin-arm64.tar.gz"
      sha256 "8ac2a2be11a8f020fa6183af6e2197d53e16085cdfdfe6df96d2e73b163efb6d"
    else
      url "https://dist.inference.sh/cli/v1.15.12/inferencesh-cli-v1.15.12-darwin-amd64.tar.gz"
      sha256 "46ca0309edc38ef5efb547fa0e9e2940c656610a232730b32b7e535dbd6c265d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.12/inferencesh-cli-v1.15.12-linux-arm64.tar.gz"
      sha256 "1d6ac2dcce78acf868ce6ab3e58f3d442303babafaaf590599b587b5961d8113"
    else
      url "https://dist.inference.sh/cli/v1.15.12/inferencesh-cli-v1.15.12-linux-amd64.tar.gz"
      sha256 "cbad9275a6c680cb1c614c5b209b89996cfb8e8497016dd1f09c2feea45325cc"
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
