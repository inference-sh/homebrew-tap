class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.15/inferencesh-cli-v1.16.15-darwin-arm64.tar.gz"
      sha256 "dfffdf2a416e77e7f51c9bccba1181acb1c85dc6a1ce741e00bc5e9985489779"
    else
      url "https://dist.inference.sh/cli/v1.16.15/inferencesh-cli-v1.16.15-darwin-amd64.tar.gz"
      sha256 "74c154ed3e87dbe2344938480c5a9c708d6972e05c22f45e077dbad11e24bc7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.15/inferencesh-cli-v1.16.15-linux-arm64.tar.gz"
      sha256 "e0d4ad9b35d4b2586ce7b301cfbd4895c0de3eb20474320561cd23de90652ac5"
    else
      url "https://dist.inference.sh/cli/v1.16.15/inferencesh-cli-v1.16.15-linux-amd64.tar.gz"
      sha256 "2a749dc0083b9be9152ba295976065ca61754eaa1abeffc31224ef149bad4378"
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
