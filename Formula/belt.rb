class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.18/inferencesh-cli-v1.15.18-darwin-arm64.tar.gz"
      sha256 "8a1cfe705bae7c26682816222ed90d2b130deab53b3f303176de80a6e6af1704"
    else
      url "https://dist.inference.sh/cli/v1.15.18/inferencesh-cli-v1.15.18-darwin-amd64.tar.gz"
      sha256 "7813e8eacc64dfa1cbad4a9a479f7441671f1e76af398c0d2dbc4be90548f4f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.18/inferencesh-cli-v1.15.18-linux-arm64.tar.gz"
      sha256 "f5e32d688cf29d115fbc331e9f12ff9fb1dfda14c8111018c0a807f9b6e05d5d"
    else
      url "https://dist.inference.sh/cli/v1.15.18/inferencesh-cli-v1.15.18-linux-amd64.tar.gz"
      sha256 "78bf7e791452c29e03d077a0d42c255828a7893b8b119885b5285b9694efc119"
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
