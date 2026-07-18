class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.14/inferencesh-cli-v1.15.14-darwin-arm64.tar.gz"
      sha256 "3a57bbe1b2d25bc049b33ad422425a76d1b72b114bd65796fe434714eedecc3e"
    else
      url "https://dist.inference.sh/cli/v1.15.14/inferencesh-cli-v1.15.14-darwin-amd64.tar.gz"
      sha256 "b613387089c867ae21f66239067cc81c4f08d687a80295ba2b91b0e3d7915e06"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.14/inferencesh-cli-v1.15.14-linux-arm64.tar.gz"
      sha256 "5a5eebfdb6096b73c27db5348841c0a34f00b182986f196c896aa0f684b87199"
    else
      url "https://dist.inference.sh/cli/v1.15.14/inferencesh-cli-v1.15.14-linux-amd64.tar.gz"
      sha256 "df9877bcd2797b6287bd2917cdabc99e24d4d7fd8a39804eb7153065df7c0308"
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
