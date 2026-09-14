class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.33"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.33/inferencesh-cli-v1.18.33-darwin-arm64.tar.gz"
      sha256 "ccb4803bb4aa3b40a6460bbee176e99b39f3f6124055ed507d09faf624dcac40"
    else
      url "https://dist.inference.sh/cli/v1.18.33/inferencesh-cli-v1.18.33-darwin-amd64.tar.gz"
      sha256 "6a1609d53a103d4459a420112d1f71448dce5398616cdf5e982e205bcbe1fe88"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.33/inferencesh-cli-v1.18.33-linux-arm64.tar.gz"
      sha256 "4646c0e6ecfa8c2a5051c81538096463a9a4bc7732ff25cd032f7aa983eec60d"
    else
      url "https://dist.inference.sh/cli/v1.18.33/inferencesh-cli-v1.18.33-linux-amd64.tar.gz"
      sha256 "266079e005f08673932d5f2b08d7c7010a6e6755557f74890c4db47b730dd4c4"
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
