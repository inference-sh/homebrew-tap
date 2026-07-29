class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.8/inferencesh-cli-v1.16.8-darwin-arm64.tar.gz"
      sha256 "53751b6ef5e31ddfc1c309642fa931a202089834da7ecf683020c6eda082e963"
    else
      url "https://dist.inference.sh/cli/v1.16.8/inferencesh-cli-v1.16.8-darwin-amd64.tar.gz"
      sha256 "4886524f1b99d6a474d8513803b634c2ed74a6962c75f79f567a17a2472b4929"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.8/inferencesh-cli-v1.16.8-linux-arm64.tar.gz"
      sha256 "90851cc0df8ce2a01bbe5fbd9ceca3e62bd529f5338a66ef60603e0e807b4e96"
    else
      url "https://dist.inference.sh/cli/v1.16.8/inferencesh-cli-v1.16.8-linux-amd64.tar.gz"
      sha256 "59db259842ae01cb1420c823f335ad90106b2465cff4a60239de74492cb0a90e"
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
