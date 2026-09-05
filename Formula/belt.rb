class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.19/inferencesh-cli-v1.18.19-darwin-arm64.tar.gz"
      sha256 "7999d6831a163a45f93166a72dcdafb78106d1b2fa274d88bee7cf38eaadd882"
    else
      url "https://dist.inference.sh/cli/v1.18.19/inferencesh-cli-v1.18.19-darwin-amd64.tar.gz"
      sha256 "f8e2f6b5626df1e1eb715c6138f5ee57dd05e68ad322c0421aa141558cfa48bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.19/inferencesh-cli-v1.18.19-linux-arm64.tar.gz"
      sha256 "1fd6762d1f36dea6159a9cc78afd7d28b149a8fe8abc6e6034ab9624ecd22986"
    else
      url "https://dist.inference.sh/cli/v1.18.19/inferencesh-cli-v1.18.19-linux-amd64.tar.gz"
      sha256 "283545e98c52a23d9fa3d607ec5cc85f87d75150fa80e9b0a1e955e80aef211a"
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
