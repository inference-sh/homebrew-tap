class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.24/inferencesh-cli-v1.17.24-darwin-arm64.tar.gz"
      sha256 "bf87db850cebbd95416ca451bc3b4ca5aa647d58c779d3d1cceb9bfc644da98c"
    else
      url "https://dist.inference.sh/cli/v1.17.24/inferencesh-cli-v1.17.24-darwin-amd64.tar.gz"
      sha256 "ee762a57ac327ad3ad581351e7cc41353e7f321aad9860334b793c1fde2102e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.24/inferencesh-cli-v1.17.24-linux-arm64.tar.gz"
      sha256 "e3a8ea06d799fd285147b624aafda34768a54f49d72ea6db937e5ffe4f3334d0"
    else
      url "https://dist.inference.sh/cli/v1.17.24/inferencesh-cli-v1.17.24-linux-amd64.tar.gz"
      sha256 "18e911ff2aa6beb3205ecb6f041639259cfdc336533ded358b3d17509a7e478c"
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
