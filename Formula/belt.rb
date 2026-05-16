class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.19-darwin-arm64.tar.gz"
      sha256 "49c45e32dcdf5ca540ec81e35700f6576b3ca28c4d6a1d4fc6bcfd7bcb70e154"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.19-darwin-amd64.tar.gz"
      sha256 "07578bbc9b01feefc99af0e7542d04a56392ba3ec0c7a10cace24b3c87e0eddf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.19-linux-arm64.tar.gz"
      sha256 "8403e1c0fb35c9d0bcb92bb7ebb0f150a7e611bebfc57817eff9fdc4474e7beb"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.19-linux-amd64.tar.gz"
      sha256 "39e4744806a9baa2b6dfb319a111985634a74abe22849f2a7f2b1e8a8a2672a1"
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
