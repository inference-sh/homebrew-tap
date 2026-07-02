class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.14.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.9-darwin-arm64.tar.gz"
      sha256 "2d7293408a4b8dc897813ff54be2935d47a40ca05e082d04a19cd6df599f32c6"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.9-darwin-amd64.tar.gz"
      sha256 "ae103e41e478959a9f8ce21ccd958d932d7b5fd07b6456f64a35496a58e08163"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.9-linux-arm64.tar.gz"
      sha256 "9c88712f8c2dbe965cb9a056a7e0df48768277c3d27aedf473ea04e4340f15cb"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.9-linux-amd64.tar.gz"
      sha256 "fa7ec9ac944e5262f21d498f83ff8f084e33881a67d57192afb625a6161708e0"
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
