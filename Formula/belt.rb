class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.22/inferencesh-cli-v1.28.22-darwin-arm64.tar.gz"
      sha256 "e56e911d4d47b3fd1205639e088428243d1af2b6edffaa5d79a5a81fbaecd01c"
    else
      url "https://dist.inference.sh/cli/v1.28.22/inferencesh-cli-v1.28.22-darwin-amd64.tar.gz"
      sha256 "8db4c8b0e764389d690049dae06a3eded2e9f32ec62e497522ef98cba0702ed8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.22/inferencesh-cli-v1.28.22-linux-arm64.tar.gz"
      sha256 "f7baa8f134f72837ad5461fd798e52a65c177c3dbc45ce8bfd455c25550a09c5"
    else
      url "https://dist.inference.sh/cli/v1.28.22/inferencesh-cli-v1.28.22-linux-amd64.tar.gz"
      sha256 "e9ae31ee0056a2061dfb242a05c0a10394c1be94a1a11cc8982fa15fe9c21262"
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
