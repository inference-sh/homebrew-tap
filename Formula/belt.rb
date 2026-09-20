class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.51"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.51/inferencesh-cli-v1.18.51-darwin-arm64.tar.gz"
      sha256 "7482c55a6f0f9742b46fbf1ad7d360bda7d0d219cb03dc8c43c64ec4748c9b7a"
    else
      url "https://dist.inference.sh/cli/v1.18.51/inferencesh-cli-v1.18.51-darwin-amd64.tar.gz"
      sha256 "81079fe5eb0708b24cbf581c529ec87b2d16d35740d19dc2070ebebac0903fe7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.51/inferencesh-cli-v1.18.51-linux-arm64.tar.gz"
      sha256 "333072f819ccd16aeb123013d8f739eb41eb1b8e695774688351ae330e3fa76d"
    else
      url "https://dist.inference.sh/cli/v1.18.51/inferencesh-cli-v1.18.51-linux-amd64.tar.gz"
      sha256 "5d485ffa0c3476b02598b19e493ca6cad6ace6218ba47603639e9019bd0826bf"
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
