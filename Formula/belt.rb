class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.29.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.21/inferencesh-cli-v1.29.21-darwin-arm64.tar.gz"
      sha256 "f329c46cbede3e51885d625b1fe1e6651c631370d2b32f10fae4a65a72008ce2"
    else
      url "https://dist.inference.sh/cli/v1.29.21/inferencesh-cli-v1.29.21-darwin-amd64.tar.gz"
      sha256 "59cbc0f3d147b518c7453a84bf0a88a236dbf4465eb31a1c66459194ac8e9b9b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.29.21/inferencesh-cli-v1.29.21-linux-arm64.tar.gz"
      sha256 "afffd36445a696323aecd6287d907b3554842a89ea168a45daa785321fe1d634"
    else
      url "https://dist.inference.sh/cli/v1.29.21/inferencesh-cli-v1.29.21-linux-amd64.tar.gz"
      sha256 "2ee3875c0e8e0d6c116b4fe93626994e0d0d966f8fe799114b18eda94340fd2f"
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
