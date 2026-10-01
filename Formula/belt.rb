class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.6/inferencesh-cli-v1.19.6-darwin-arm64.tar.gz"
      sha256 "18a70e1cd0949fb33cb76aeaf543b825ae69c10714e22ba98e8296cd51e6d4b8"
    else
      url "https://dist.inference.sh/cli/v1.19.6/inferencesh-cli-v1.19.6-darwin-amd64.tar.gz"
      sha256 "3dd710bb7171d677fb05e5907d4f20c491234f8899793057bba63ac1eb46146a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.6/inferencesh-cli-v1.19.6-linux-arm64.tar.gz"
      sha256 "563bed076a0c17bea0a56b2c0121e2ac800559182b02aadc48159903dc365c96"
    else
      url "https://dist.inference.sh/cli/v1.19.6/inferencesh-cli-v1.19.6-linux-amd64.tar.gz"
      sha256 "df8d2d1c69ecbd5e432e95c9ab94ea9da63f5993d12f7ec0bf1d29807ddb15ec"
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
