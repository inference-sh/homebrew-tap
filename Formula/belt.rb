class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.24.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.0/inferencesh-cli-v1.24.0-darwin-arm64.tar.gz"
      sha256 "b3e2dd0ed6c3318f53b7b4e4eaa846e3cd583b5b9e742aca5c10e14022119be8"
    else
      url "https://dist.inference.sh/cli/v1.24.0/inferencesh-cli-v1.24.0-darwin-amd64.tar.gz"
      sha256 "fefbb42c24b168c9ce485ba1897331aae913869e760d9a58e6d7fa869a2a1d0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.24.0/inferencesh-cli-v1.24.0-linux-arm64.tar.gz"
      sha256 "2cd2505753cb885845ca67a6fabaf19ddf705ffeba442dbd83e18016916afdf6"
    else
      url "https://dist.inference.sh/cli/v1.24.0/inferencesh-cli-v1.24.0-linux-amd64.tar.gz"
      sha256 "553765499d2e247329efcd340eb33594e2f6d68d925ca77d64cf86d9b82295b7"
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
