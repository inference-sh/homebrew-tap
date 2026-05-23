class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.11-darwin-arm64.tar.gz"
      sha256 "0fd83183b18068d48a1406968e17352754502545d0331222c1d538286e62d1b4"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.11-darwin-amd64.tar.gz"
      sha256 "356febb1d9d92ce542527676115ad2416d6d579ad3074a7d51a36c3a24f607c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.11-linux-arm64.tar.gz"
      sha256 "894d5f40d5bb72a5296b72d19bae0255974ef36c3ae0f6e7da565a7c81e5087a"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.11-linux-amd64.tar.gz"
      sha256 "9d9f798c76315cb45ff195344114ba331b43f004edca6ce02375542ed32b7028"
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
