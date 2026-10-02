class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.8/inferencesh-cli-v1.19.8-darwin-arm64.tar.gz"
      sha256 "609f2e7d0d1eb7822894e1af045c347ed87d2e3b099f890e5c6b34da73fb1f2a"
    else
      url "https://dist.inference.sh/cli/v1.19.8/inferencesh-cli-v1.19.8-darwin-amd64.tar.gz"
      sha256 "37d4af6470d759d43954f820141a0442c68f8f835dfcf7afc2e67795ffb504fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.8/inferencesh-cli-v1.19.8-linux-arm64.tar.gz"
      sha256 "926b87e933c2e52adfa87092412493f2cb032f3132c852ea46d3411bc40ece4f"
    else
      url "https://dist.inference.sh/cli/v1.19.8/inferencesh-cli-v1.19.8-linux-amd64.tar.gz"
      sha256 "cb99846d308875a3064cf818fe5fc7763e0a83650fb7a9ec9ceeff5f21691aad"
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
