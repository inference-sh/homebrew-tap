class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.34"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.34/inferencesh-cli-v1.28.34-darwin-arm64.tar.gz"
      sha256 "d94a0ff26c064fadb90e79a0d9c9b323671b0f5da09eacf3e5a5597f0e10ed5b"
    else
      url "https://dist.inference.sh/cli/v1.28.34/inferencesh-cli-v1.28.34-darwin-amd64.tar.gz"
      sha256 "1680544ccbc4ef52b8caf23bc2c0e3ac02f3d4583b00d380a5b6ddda774ae931"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.34/inferencesh-cli-v1.28.34-linux-arm64.tar.gz"
      sha256 "a4382b7f4d8421047a00ea7ce292a3b0697d6287be4aa80f4f48f25dc26659e3"
    else
      url "https://dist.inference.sh/cli/v1.28.34/inferencesh-cli-v1.28.34-linux-amd64.tar.gz"
      sha256 "f885037fa9c8c32f0430c92511b75102d29680585dc09363d32c4b9f7cc3fc96"
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
