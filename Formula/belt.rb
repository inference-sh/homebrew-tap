class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.15/inferencesh-cli-v1.19.15-darwin-arm64.tar.gz"
      sha256 "2343607c53e5e690e0b4ccde60df58736123e7341bf77566bbea15ebe7a1e525"
    else
      url "https://dist.inference.sh/cli/v1.19.15/inferencesh-cli-v1.19.15-darwin-amd64.tar.gz"
      sha256 "fbddb360791d396727bdbece6352f428782733281366982363561a986dbea6a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.15/inferencesh-cli-v1.19.15-linux-arm64.tar.gz"
      sha256 "7478334e27b4888373dd9ad4e2be6a2b929cd374ff8aad64106aad67c1c34943"
    else
      url "https://dist.inference.sh/cli/v1.19.15/inferencesh-cli-v1.19.15-linux-amd64.tar.gz"
      sha256 "190ca053e208b6942c0ea2d4aa51b071b50592831f4bad8d522ad4b138db1290"
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
