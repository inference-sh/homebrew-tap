class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.21/inferencesh-cli-v1.15.21-darwin-arm64.tar.gz"
      sha256 "adc4cae7d8dd570891725359308a6efa53a08a6b5132e0e744c97b4cd09367df"
    else
      url "https://dist.inference.sh/cli/v1.15.21/inferencesh-cli-v1.15.21-darwin-amd64.tar.gz"
      sha256 "57351da99fcd1f5c12797bde6124e3e1b952a8d73fa84154549b34d800416bd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.21/inferencesh-cli-v1.15.21-linux-arm64.tar.gz"
      sha256 "2349fc70b330a37434946056a5ee66a1dc04fabfcd102e573091b0d816d0cf9f"
    else
      url "https://dist.inference.sh/cli/v1.15.21/inferencesh-cli-v1.15.21-linux-amd64.tar.gz"
      sha256 "178f3c277f81d2964d4a767e27c09bf8593d601d45f2f308118139c697d48c72"
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
