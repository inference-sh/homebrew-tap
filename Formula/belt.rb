class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.24.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.7/inferencesh-cli-v1.24.7-darwin-arm64.tar.gz"
      sha256 "383d9cc02c6528dcfe8cd6c8883dc43949da847db76dfdd848e42c9c038f9f0b"
    else
      url "https://dist.inference.sh/cli/v1.24.7/inferencesh-cli-v1.24.7-darwin-amd64.tar.gz"
      sha256 "549dd1ca7e3cd93a798ef2a7fc8dd947d9fc4698dae63a88273693f5d9a7bfc7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.7/inferencesh-cli-v1.24.7-linux-arm64.tar.gz"
      sha256 "7da34002203e667dca57fcce1ab8aa40adf0b0d4694ebd564f65c283c8ca4fcf"
    else
      url "https://dist.inference.sh/cli/v1.24.7/inferencesh-cli-v1.24.7-linux-amd64.tar.gz"
      sha256 "9f587dcb003ae2a67c52a63967695d2939bf2c7dd539aef3aeb760056f65054d"
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
