class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.16-darwin-arm64.tar.gz"
      sha256 "e3fc314334968ddf72200af8a74c21369b8fb39d9feb8b6d4ecc4880ad00a997"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.16-darwin-amd64.tar.gz"
      sha256 "c9b49324bdf2fcf041f756d64f017f213e5bfd808a0ec024947183880120d321"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.16-linux-arm64.tar.gz"
      sha256 "158e987eb028e53831dd61455bc7b2447d4fefea7610dba6044e672d8b1e3c26"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.16-linux-amd64.tar.gz"
      sha256 "09d14c30ce2828769aba2f3bff5fc76223d17d1a9581af2e192bd55318b6afd3"
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
