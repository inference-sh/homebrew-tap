class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.27.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.27.2/inferencesh-cli-v1.27.2-darwin-arm64.tar.gz"
      sha256 "9941ee5c898574c551eccc28686528be9b8c69b9a118dccc853f58ea7248217b"
    else
      url "https://dist.inference.sh/cli/v1.27.2/inferencesh-cli-v1.27.2-darwin-amd64.tar.gz"
      sha256 "de4dae6e1d33211f61e6168b98c8a9b109c95cd049376984954bcd186906e885"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.27.2/inferencesh-cli-v1.27.2-linux-arm64.tar.gz"
      sha256 "2c6c2faf7e402bc629f659b4c6a0986bc7618e7f5440392f1a55f8372a7c47d8"
    else
      url "https://dist.inference.sh/cli/v1.27.2/inferencesh-cli-v1.27.2-linux-amd64.tar.gz"
      sha256 "6634ac3b8ee422eac18dbe5b675e2288f817e1752f1c8e0b8490531ae7d6e515"
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
