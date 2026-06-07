class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.17-darwin-arm64.tar.gz"
      sha256 "c3dcbcd6f6f667b27f93553b5b13298abaa913eaf7848b9261edb46b9b3133f3"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.17-darwin-amd64.tar.gz"
      sha256 "4b04c77c795e4597f3ca8a104ceb2d8db49463867cc2b2d5d12ff1e97248050e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.17-linux-arm64.tar.gz"
      sha256 "7fe1cbff6dfe3eafc060ac45e95d62ffc4f69a90e4c0403ccdb1059668ca3e42"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.17-linux-amd64.tar.gz"
      sha256 "989d5edc801ce15ff0fa53da8f90b0a1debe2cb2f0aecbd29a02e38858a93c1e"
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
