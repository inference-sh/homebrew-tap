class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.2-darwin-arm64.tar.gz"
      sha256 "e3f0e09066dec33b694803fb46edb9a8ae717d7c56348d5f967d15557cda105f"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.2-darwin-amd64.tar.gz"
      sha256 "ea7b1f0f794b9deed64759ae2e400a201a0ccc400eb57e408db697f533ef529c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.2-linux-arm64.tar.gz"
      sha256 "d9cd478f40821e13b6442b309c202a656793a33f3ccaeb727db230b359e456e5"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.2-linux-amd64.tar.gz"
      sha256 "fa89d5270a9832bfd72d9d4e6db138e33ddf772c4a8ae559bd65ddcd25195a2f"
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
