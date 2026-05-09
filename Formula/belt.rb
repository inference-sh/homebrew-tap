class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.10.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.3-darwin-arm64.tar.gz"
      sha256 "b4287d6f31cc2f281bace9835e599f92cac70df1e5331fda561adb76fa1524f9"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.3-darwin-amd64.tar.gz"
      sha256 "db64fafaeefea87edf293e99ff5210a86dd4746347ce339b12c9d39a1d9fdcfa"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.3-linux-arm64.tar.gz"
      sha256 "2717feb085b09583d09597d637f54ae6744b0c8148e8c3c1af43901053bc6317"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.10.3-linux-amd64.tar.gz"
      sha256 "d6a05330177eb39a9191f31812bfc797325c7ae2bd2e33113d27e8772b4941a1"
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
