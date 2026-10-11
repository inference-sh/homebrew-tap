class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.22.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.22.0/inferencesh-cli-v1.22.0-darwin-arm64.tar.gz"
      sha256 "a9106f3728b4c445cb1fa41676c55fd3a2a8b8bf3c6658eba1036eb42f0bc71e"
    else
      url "https://dist.inference.sh/cli/v1.22.0/inferencesh-cli-v1.22.0-darwin-amd64.tar.gz"
      sha256 "f026b2e76b028d008e31e873e0db57a3ad4f53e48e7383d036b520f850d2802c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.22.0/inferencesh-cli-v1.22.0-linux-arm64.tar.gz"
      sha256 "6789fe1c7f6d736e6c555f05d8d70ee9e3a6d14627ea838f4edb61ab6eb0060b"
    else
      url "https://dist.inference.sh/cli/v1.22.0/inferencesh-cli-v1.22.0-linux-amd64.tar.gz"
      sha256 "50aa3be29a9f531ad598efe6201dacb9297e45be219ee9f2a291a29cf608e7d1"
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
