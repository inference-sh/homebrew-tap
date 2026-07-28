class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.5/inferencesh-cli-v1.16.5-darwin-arm64.tar.gz"
      sha256 "7cdad10cef447520dbe36d18957890729274386c247dedbc3b37a234f540e7d4"
    else
      url "https://dist.inference.sh/cli/v1.16.5/inferencesh-cli-v1.16.5-darwin-amd64.tar.gz"
      sha256 "1c4a208d0b0fa337a9de97aa46be4f707dcd38e9f58795afcd9cab0f0562df52"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.5/inferencesh-cli-v1.16.5-linux-arm64.tar.gz"
      sha256 "a2e3a6b05e04709cfaeae1415e517e8f6e6437cd164b98ba6eb85e54ec108e6b"
    else
      url "https://dist.inference.sh/cli/v1.16.5/inferencesh-cli-v1.16.5-linux-amd64.tar.gz"
      sha256 "b2ec48710b25f7dd582ad3e9153c5b8418519f40cc7245246d0174d3df82f2d0"
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
