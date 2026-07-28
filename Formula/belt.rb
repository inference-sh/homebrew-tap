class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.7/inferencesh-cli-v1.16.7-darwin-arm64.tar.gz"
      sha256 "3b21a2e6c53e1dc9969051f624d45c5d8fb48820dc5c0430081b68975fef4d50"
    else
      url "https://dist.inference.sh/cli/v1.16.7/inferencesh-cli-v1.16.7-darwin-amd64.tar.gz"
      sha256 "238a32e705d105937126cd3e7fc450e3cededdb94e98c0577507dc510d72b241"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.7/inferencesh-cli-v1.16.7-linux-arm64.tar.gz"
      sha256 "84e2a4490e45c5e2cdef0ab9eb60dbe949c3dbf115e9ff7181cad8eec752714f"
    else
      url "https://dist.inference.sh/cli/v1.16.7/inferencesh-cli-v1.16.7-linux-amd64.tar.gz"
      sha256 "d7342439d3dd906f44c48eacc479dd40cf2c7e1f4cd765449349d2bb7e022a2c"
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
