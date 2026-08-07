class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.14/inferencesh-cli-v1.17.14-darwin-arm64.tar.gz"
      sha256 "f504fff1807e4a66cdd49a42229ced60d20751349a4fb3afc5a2998c9ebd4c07"
    else
      url "https://dist.inference.sh/cli/v1.17.14/inferencesh-cli-v1.17.14-darwin-amd64.tar.gz"
      sha256 "cc42aead08072b2a6e677a9db067b40f9b5c172ec05cc811fef8f94206922632"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.14/inferencesh-cli-v1.17.14-linux-arm64.tar.gz"
      sha256 "50abe90f0928e544c65ed831f4dafe636644f46497fa0b99489b3ff953cf7a7c"
    else
      url "https://dist.inference.sh/cli/v1.17.14/inferencesh-cli-v1.17.14-linux-amd64.tar.gz"
      sha256 "ec748e649299e0c403a8e2543671723a9ab68bbd12b63eddc7509e85c326b512"
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
