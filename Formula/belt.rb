class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.13/inferencesh-cli-v1.19.13-darwin-arm64.tar.gz"
      sha256 "9ef24956ba0aaf7719158bcd14c567939aeb4352d2571e27c7bab7ec1e9d08ba"
    else
      url "https://dist.inference.sh/cli/v1.19.13/inferencesh-cli-v1.19.13-darwin-amd64.tar.gz"
      sha256 "0b2c5b2653002c3145d302d73083ebdd08b82cb60169be0795b25ae54f147076"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.13/inferencesh-cli-v1.19.13-linux-arm64.tar.gz"
      sha256 "09a59b9d70703ac81db70829f333be7d3771d99776dfaeaa78e407a797293df8"
    else
      url "https://dist.inference.sh/cli/v1.19.13/inferencesh-cli-v1.19.13-linux-amd64.tar.gz"
      sha256 "ffcb475082534d03145bafc3b3d8358a8d105e3d985075509649cffaf1220a64"
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
