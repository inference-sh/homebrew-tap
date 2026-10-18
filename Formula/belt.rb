class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.12/inferencesh-cli-v1.25.12-darwin-arm64.tar.gz"
      sha256 "8d15a63d4cea8d2d8b23a7ee8f77151807434b4290ed452cddd7edc17537f3ab"
    else
      url "https://dist.inference.sh/cli/v1.25.12/inferencesh-cli-v1.25.12-darwin-amd64.tar.gz"
      sha256 "e387300e35b91f606e283cb58b01dc6e78864cb853f7201826bff1a08eed298f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.12/inferencesh-cli-v1.25.12-linux-arm64.tar.gz"
      sha256 "cbdfc16965f8b99e4f6f8ded83a4ec37de8b4cab7e0953e18a5496b992195c1a"
    else
      url "https://dist.inference.sh/cli/v1.25.12/inferencesh-cli-v1.25.12-linux-amd64.tar.gz"
      sha256 "f515f723aaca5fbbfd89fc59df86705c6cdbd06f3d54ba4b9dbd0141db974e42"
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
