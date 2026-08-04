class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.25/inferencesh-cli-v1.16.25-darwin-arm64.tar.gz"
      sha256 "ceda1105ba56c03490d11fd1b31b26e475193433f12316e99a30f9d8311f3284"
    else
      url "https://dist.inference.sh/cli/v1.16.25/inferencesh-cli-v1.16.25-darwin-amd64.tar.gz"
      sha256 "752b742c4a9512f825131ed81a6f64388aafa65fd57e8998fe562fc4a2e4b79f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.25/inferencesh-cli-v1.16.25-linux-arm64.tar.gz"
      sha256 "67faa8caf8b641122b7456156de8624afc1affe09f9d26b7146326446f213b6f"
    else
      url "https://dist.inference.sh/cli/v1.16.25/inferencesh-cli-v1.16.25-linux-amd64.tar.gz"
      sha256 "cb8fb10e21942f586f1e4c48664bd784023a9e9e64ba2647a20941da027d2810"
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
