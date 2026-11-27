class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.18/inferencesh-cli-v1.29.18-darwin-arm64.tar.gz"
      sha256 "3ad5a316cb2896c5f2b3ec4db00075cc212f11d05c8a39dd6d4d448fbab56039"
    else
      url "https://dist.inference.sh/cli/v1.29.18/inferencesh-cli-v1.29.18-darwin-amd64.tar.gz"
      sha256 "049b27728b2bc4e962e84b70c287fcd2b1ec636c3075ad205864bc4b3fc95c93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.18/inferencesh-cli-v1.29.18-linux-arm64.tar.gz"
      sha256 "abce2db95eaed0d8a27d9b5a836a09a19551d532aed120c980f1981773203eba"
    else
      url "https://dist.inference.sh/cli/v1.29.18/inferencesh-cli-v1.29.18-linux-amd64.tar.gz"
      sha256 "0f362506f9f930f0eeea52d5fc06e3dd9e2d5763676fb69a7b88afdecfea6c32"
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
