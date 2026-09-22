class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.54"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.54/inferencesh-cli-v1.18.54-darwin-arm64.tar.gz"
      sha256 "3460b777b76fcc687a95f0638de7b15ff922a4b59556b784e7d90a87e7a99cdd"
    else
      url "https://dist.inference.sh/cli/v1.18.54/inferencesh-cli-v1.18.54-darwin-amd64.tar.gz"
      sha256 "f387bd43d9696efef3cf51afdbad2329ded302171acc92e0a531c9360ec72548"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.54/inferencesh-cli-v1.18.54-linux-arm64.tar.gz"
      sha256 "86089fc4c3b6172059a1c23b01ab01e49766d0246ceacb322851b15e1ea16f0b"
    else
      url "https://dist.inference.sh/cli/v1.18.54/inferencesh-cli-v1.18.54-linux-amd64.tar.gz"
      sha256 "88e4a94ce3a108741e93e3d2935584fbce5875334da05bc795b50d9177d72769"
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
