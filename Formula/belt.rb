class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.19"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.19/inferencesh-cli-v1.19.19-darwin-arm64.tar.gz"
      sha256 "bd527c1411a936529ed78131006e493774936a785b697ec6af5c7d5975a77808"
    else
      url "https://dist.inference.sh/cli/v1.19.19/inferencesh-cli-v1.19.19-darwin-amd64.tar.gz"
      sha256 "36ae4f666fe16dae128da81b3c9144e2af56a579c3ec85bc0e735638840fad83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.19/inferencesh-cli-v1.19.19-linux-arm64.tar.gz"
      sha256 "a0596bab63a990ffb67e33ec316fc3c7e4f51fc85c3a251974ffb8effce6eba8"
    else
      url "https://dist.inference.sh/cli/v1.19.19/inferencesh-cli-v1.19.19-linux-amd64.tar.gz"
      sha256 "edb0e4b02f81e32c02819e61252db7c25dc9aee67771ca1fc957b058ee5fc267"
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
