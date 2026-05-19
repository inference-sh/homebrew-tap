class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.29"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.29-darwin-arm64.tar.gz"
      sha256 "23d1d03322673c6f08e31b946b90b877fdc3a3716da5bea1a48d6fa49c487672"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.29-darwin-amd64.tar.gz"
      sha256 "d3983e39fadc61f1342c5ee0ff85bc3eb986cff543ffeba92ea7e3a81518910e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.29-linux-arm64.tar.gz"
      sha256 "8f7483cafd615f79be0ac78a8a8caae6594e05bc28025eda04d8e392e61d4b52"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.29-linux-amd64.tar.gz"
      sha256 "6182ede4cad4caf40d3f96f7b5bcb4ad2fbce2c50d0f791ca1888c97faed4d62"
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
