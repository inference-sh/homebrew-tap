class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.19/inferencesh-cli-v1.28.19-darwin-arm64.tar.gz"
      sha256 "351a214a427bfb623b3ab73b287ded8cc0f9569f959d4865e242f9a3d9507e1d"
    else
      url "https://dist.inference.sh/cli/v1.28.19/inferencesh-cli-v1.28.19-darwin-amd64.tar.gz"
      sha256 "90b5051d6302d79f445d33e7d4d4805ea510a6d279b624700a6e1c00fad29965"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.19/inferencesh-cli-v1.28.19-linux-arm64.tar.gz"
      sha256 "ad6f1b2dbf36b3283427e7430b602995b69c0277a1dcaafc0f3a79eea2a6a38e"
    else
      url "https://dist.inference.sh/cli/v1.28.19/inferencesh-cli-v1.28.19-linux-amd64.tar.gz"
      sha256 "b105ab1e39608aa7f147ace062e6a3dbb384c1f36c5f4bd5a4855d424c36c574"
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
