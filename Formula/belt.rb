class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.13/inferencesh-cli-v1.25.13-darwin-arm64.tar.gz"
      sha256 "dedbf33bdf4b6f18eda199f81b6a44588ff712cc2fa384042bfc02d7bd34d499"
    else
      url "https://dist.inference.sh/cli/v1.25.13/inferencesh-cli-v1.25.13-darwin-amd64.tar.gz"
      sha256 "6961970ae5c0142e8656909604fede327788e06ade2c90e71cb70471a5b58286"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.13/inferencesh-cli-v1.25.13-linux-arm64.tar.gz"
      sha256 "00a4c46723b8619055aadbb4dc7e8271d829f19c71e8a0749f413e10fcfb99d2"
    else
      url "https://dist.inference.sh/cli/v1.25.13/inferencesh-cli-v1.25.13-linux-amd64.tar.gz"
      sha256 "0550b04bda20468244e9f856f1be39dac947277c2fa791d3b22fe3a25dd354a1"
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
