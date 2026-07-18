class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.10/inferencesh-cli-v1.15.10-darwin-arm64.tar.gz"
      sha256 "2b4ce751f48e472bdeb89018a8cfe1c5668cf82b3e2178de53d4697018faccb3"
    else
      url "https://dist.inference.sh/cli/v1.15.10/inferencesh-cli-v1.15.10-darwin-amd64.tar.gz"
      sha256 "c9a208bcc0c992554618f32a848858df978f57bd85f2f2efe498ec88695a4f4a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.10/inferencesh-cli-v1.15.10-linux-arm64.tar.gz"
      sha256 "749199cb71ec4f549705ae9dba587e8caaf0eada38a1572a5c5c25b9c11dbe23"
    else
      url "https://dist.inference.sh/cli/v1.15.10/inferencesh-cli-v1.15.10-linux-amd64.tar.gz"
      sha256 "d7381f8acf4f046d24a1022c3150457189d7e5e9e268b35254ea47c82b15113f"
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
