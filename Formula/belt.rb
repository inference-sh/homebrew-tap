class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.25.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.9/inferencesh-cli-v1.25.9-darwin-arm64.tar.gz"
      sha256 "9039ff183af25593814158b13a7182a9e401ed0675ae210abc86632438ff8ac3"
    else
      url "https://dist.inference.sh/cli/v1.25.9/inferencesh-cli-v1.25.9-darwin-amd64.tar.gz"
      sha256 "9bb5c026b9e7b855fd3a53e0f49a9c4c93898eacba67ea135aa95df983b2e46b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.25.9/inferencesh-cli-v1.25.9-linux-arm64.tar.gz"
      sha256 "a37d4abf66ab11f25de726e32ddebf9297d504eb7ccf8e535de50a0e46a76800"
    else
      url "https://dist.inference.sh/cli/v1.25.9/inferencesh-cli-v1.25.9-linux-amd64.tar.gz"
      sha256 "366d74ca13ea81ba4c3bf0dfb1bd03c85c396bc3dd215e7baa0d2762c68dc404"
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
