class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.47"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.47/inferencesh-cli-v1.28.47-darwin-arm64.tar.gz"
      sha256 "dec9be63a03f7a2b527fa5959bd9f466077c43aafbe7c931b5a10963837d936a"
    else
      url "https://dist.inference.sh/cli/v1.28.47/inferencesh-cli-v1.28.47-darwin-amd64.tar.gz"
      sha256 "997eab34fb05569253107e3254c7d991ff37ee21a37b9098099574470ed9bb3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.47/inferencesh-cli-v1.28.47-linux-arm64.tar.gz"
      sha256 "10d30b8960d96e607b39942b2052f16888791be1494f9ad3aa6f1cad782ca089"
    else
      url "https://dist.inference.sh/cli/v1.28.47/inferencesh-cli-v1.28.47-linux-amd64.tar.gz"
      sha256 "9fcd09403406ecb1273f821dd0b84c829c885bbaf95a762ebf656b5f44b96ca9"
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
