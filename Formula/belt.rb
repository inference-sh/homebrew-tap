class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.0/inferencesh-cli-v1.17.0-darwin-arm64.tar.gz"
      sha256 "1bd7cccb0976692e6b34cdc09b59e9f050d1ca36dda987f70729447242439e67"
    else
      url "https://dist.inference.sh/cli/v1.17.0/inferencesh-cli-v1.17.0-darwin-amd64.tar.gz"
      sha256 "9ce26fec870d158d25d92c5a522690cf832308f34c38df82485bb3369eccd844"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.0/inferencesh-cli-v1.17.0-linux-arm64.tar.gz"
      sha256 "3898810ca97cef76f81979a938ad45cf3285a19d56501287cdca21072fffb590"
    else
      url "https://dist.inference.sh/cli/v1.17.0/inferencesh-cli-v1.17.0-linux-amd64.tar.gz"
      sha256 "be6ae2971012cede2ce8fe5dbb4e8534bda64aa40212a0345869ea556a23f444"
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
