class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.16/inferencesh-cli-v1.15.16-darwin-arm64.tar.gz"
      sha256 "8a5473f9dc93696b3d999e240dc76a6000f5d5001dcb56aa0451ccb8ee6041c2"
    else
      url "https://dist.inference.sh/cli/v1.15.16/inferencesh-cli-v1.15.16-darwin-amd64.tar.gz"
      sha256 "ec5b94403b665ae427f64faa905bd97519de0fa7cd28c1891dc73560bb0906e4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.16/inferencesh-cli-v1.15.16-linux-arm64.tar.gz"
      sha256 "622d961ac917c83e73072d6d2a68755c1708a864a90fcbb87193eb9d68911248"
    else
      url "https://dist.inference.sh/cli/v1.15.16/inferencesh-cli-v1.15.16-linux-amd64.tar.gz"
      sha256 "0a171e1c17397389885b834ccb8a99a8448d812e387ee70e7b3aae574e22c569"
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
