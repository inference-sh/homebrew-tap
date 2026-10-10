class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.20.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.20.0/inferencesh-cli-v1.20.0-darwin-arm64.tar.gz"
      sha256 "e1a5127561405bb62dc6d07dcf8d7a89d5f57e752857d1bc5e917b09eba6fc4f"
    else
      url "https://dist.inference.sh/cli/v1.20.0/inferencesh-cli-v1.20.0-darwin-amd64.tar.gz"
      sha256 "1e050f276a184b677ae42667435c3cd1ddd6d92c264006834707efe2da5117fe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.20.0/inferencesh-cli-v1.20.0-linux-arm64.tar.gz"
      sha256 "28ebfca26436a32bdae783f48d054c393958166cc2e695ce87bd61b74e7ebbc7"
    else
      url "https://dist.inference.sh/cli/v1.20.0/inferencesh-cli-v1.20.0-linux-amd64.tar.gz"
      sha256 "1e03ad163bb9d85b2c32e80d5878988492999d1d390a462adbf322c0322107c4"
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
