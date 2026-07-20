class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.20/inferencesh-cli-v1.15.20-darwin-arm64.tar.gz"
      sha256 "556619bfe73a446e13e4fe065fdb59f8edc780ab56105ac4c5bf60fdf5b96ff8"
    else
      url "https://dist.inference.sh/cli/v1.15.20/inferencesh-cli-v1.15.20-darwin-amd64.tar.gz"
      sha256 "778110563e25d114a85ac5f2e64887d95d06f00bf3d46e077cd306cae008cf4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.20/inferencesh-cli-v1.15.20-linux-arm64.tar.gz"
      sha256 "eb52b5be2024eef6a9dbcb5103bf2851cb7e39ab465feefd91204d93b6bae8bc"
    else
      url "https://dist.inference.sh/cli/v1.15.20/inferencesh-cli-v1.15.20-linux-amd64.tar.gz"
      sha256 "68308659ca99ac4dd7a751ec6cb255c74250baa7784df6c8ce2e7ef99b3de7e4"
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
