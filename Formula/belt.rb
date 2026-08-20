class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.26/inferencesh-cli-v1.17.26-darwin-arm64.tar.gz"
      sha256 "17449705d7cd7a043d0e5c8a406c6bbf40385e3cd28b3ca43f4c91fe5b33a540"
    else
      url "https://dist.inference.sh/cli/v1.17.26/inferencesh-cli-v1.17.26-darwin-amd64.tar.gz"
      sha256 "97ab8c065315e7eacc93cdba293a2593c9656625c719ad2fa8496285fc87021d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.26/inferencesh-cli-v1.17.26-linux-arm64.tar.gz"
      sha256 "db7fcb7057c4f0651ed162c4384bce0af1e8bffe4b9d585e8d153a77fca0bc52"
    else
      url "https://dist.inference.sh/cli/v1.17.26/inferencesh-cli-v1.17.26-linux-amd64.tar.gz"
      sha256 "cc9458b283d08c7bf1ae08a5b9d61d09d52fd0b992a2071d8f50d7e6ff958164"
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
