class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.4-darwin-arm64.tar.gz"
      sha256 "a90ead1444c63619e3effbd337f6ccf3234ed909c54113d53bcc13649c88d4e9"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.4-darwin-amd64.tar.gz"
      sha256 "a2d347dfd29971432096f61c6b5e212ea6b808253225239095a322106f50a643"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.4-linux-arm64.tar.gz"
      sha256 "036fd56620c3ff278f27b1dc18797c44e5b031c15a1a885ecd607d69349d716d"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.4-linux-amd64.tar.gz"
      sha256 "2aba83652c5815fcfeb6d9d301276fac48b03e96da30953acb0394af7964d38d"
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
