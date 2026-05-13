class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.12-darwin-arm64.tar.gz"
      sha256 "662d0585adf9b29de9fc043355af425549314eaa8855164cc41922f750edd076"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.12-darwin-amd64.tar.gz"
      sha256 "a4f689362bb8bee60786a534be1b67e55dda6b429936ec4a1df007d516e00c69"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.12-linux-arm64.tar.gz"
      sha256 "5eff733dfefe882e890cd70d70e6cf4f16d2515e7acd35cf57339093ade7e6ac"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.12-linux-amd64.tar.gz"
      sha256 "e1e9b61cd7c1f7243c2b99e00acf9f2f4bc01399d34ded87d3706ee5f6c03e6d"
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
