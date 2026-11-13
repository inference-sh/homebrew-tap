class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.45"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.45/inferencesh-cli-v1.28.45-darwin-arm64.tar.gz"
      sha256 "958f7e21a6db0ee3833291b4eab593d9b604706b403e9cb58422838dfc22d370"
    else
      url "https://dist.inference.sh/cli/v1.28.45/inferencesh-cli-v1.28.45-darwin-amd64.tar.gz"
      sha256 "613fa665f7a544934bafc43dd4d2fef22dcae8f04d92a431dd93a22809281852"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.45/inferencesh-cli-v1.28.45-linux-arm64.tar.gz"
      sha256 "f1ca0e1c6a8ca16ad569adc44d7b9527314dd28be10d427e6510c409c2ee9da5"
    else
      url "https://dist.inference.sh/cli/v1.28.45/inferencesh-cli-v1.28.45-linux-amd64.tar.gz"
      sha256 "6125d31a21c4020a7f051343a3b9bdbc78f5018045c2b8c7cfa29c733b4dbce8"
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
