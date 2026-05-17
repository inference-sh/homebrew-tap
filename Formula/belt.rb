class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.11-darwin-arm64.tar.gz"
      sha256 "b334e2b3cf9a7583ab7cc3e6ca354f48c41a9d6db67ec7611840a1e8aaa3ac05"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.11-darwin-amd64.tar.gz"
      sha256 "7e60b77e0d585665a0caf4a8f11ae324046f951046516d73383a5a95d7ec3c53"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.11-linux-arm64.tar.gz"
      sha256 "98d8cc51bdb0e618d3db79dbf91e6365b0642a53af7fe944f11544b8e1d61621"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.11-linux-amd64.tar.gz"
      sha256 "23adf51e2ca59d7a46e9079715329d83b0d00f54d72e24f0ea786a624039a63d"
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
