class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.10/inferencesh-cli-v1.26.10-darwin-arm64.tar.gz"
      sha256 "92bf150a06907d65e67024a8181fe2427d2756fdae35cdf2f02a60ea1216390e"
    else
      url "https://dist.inference.sh/cli/v1.26.10/inferencesh-cli-v1.26.10-darwin-amd64.tar.gz"
      sha256 "e27807b4fef6dcff1d3118d94a472c7e83d15b3bc5223a4407cdb449d6f325f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.10/inferencesh-cli-v1.26.10-linux-arm64.tar.gz"
      sha256 "65680cb19ceb20ed56217728324c544ea8d9953a7d802e29eb9d94506c60c04c"
    else
      url "https://dist.inference.sh/cli/v1.26.10/inferencesh-cli-v1.26.10-linux-amd64.tar.gz"
      sha256 "5475e45ca1da855495334694b55d26e5452b639b464303810b89076ee95bf683"
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
