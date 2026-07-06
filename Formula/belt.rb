class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.14.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.13/inferencesh-cli-v1.14.13-darwin-arm64.tar.gz"
      sha256 "f2f9125de81ce87e881fb64803e472540a0bdb2151831b5a8eeffc11ef5ba37c"
    else
      url "https://dist.inference.sh/cli/v1.14.13/inferencesh-cli-v1.14.13-darwin-amd64.tar.gz"
      sha256 "11d2bb49c398d36c2eee600063975049db06670efb65e7d00121afe927d95d52"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.13/inferencesh-cli-v1.14.13-linux-arm64.tar.gz"
      sha256 "5920815173cbcc33121b0db22ee346629c2cff34b27ed23095f54cc0e22fbe64"
    else
      url "https://dist.inference.sh/cli/v1.14.13/inferencesh-cli-v1.14.13-linux-amd64.tar.gz"
      sha256 "ffd935d454804f03af7caf3e9336e0e2be7ac72e348b97ebfebfbe327e6302d4"
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
