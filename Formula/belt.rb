class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.3/inferencesh-cli-v1.28.3-darwin-arm64.tar.gz"
      sha256 "be308cebbaf8490619fc6c5933305e73fcbbfd78c917b12f4d26c89145ffc875"
    else
      url "https://dist.inference.sh/cli/v1.28.3/inferencesh-cli-v1.28.3-darwin-amd64.tar.gz"
      sha256 "c0bbfc86ee79c88e8ef1fcfac9841edde0e874b58af1eb874a20eb78b365bdf5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.3/inferencesh-cli-v1.28.3-linux-arm64.tar.gz"
      sha256 "9196e59588e6c8085141f982584e5dfcf751d30205ef0ac1436b71463296e88f"
    else
      url "https://dist.inference.sh/cli/v1.28.3/inferencesh-cli-v1.28.3-linux-amd64.tar.gz"
      sha256 "23b147610475ea5971ce25f2d61f151fdc90d2632b2b3bb004f8c5758654a6ff"
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
