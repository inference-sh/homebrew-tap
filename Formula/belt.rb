class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.14.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.12/inferencesh-cli-v1.14.12-darwin-arm64.tar.gz"
      sha256 "1e815b22b9584525adc870f4c626df7864fbb40bc1baa1eb0432edf052393c08"
    else
      url "https://dist.inference.sh/cli/v1.14.12/inferencesh-cli-v1.14.12-darwin-amd64.tar.gz"
      sha256 "2f1d6ea346e730c58da5a462ebadb2ba095617527ee50224a7edae33068c67b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.14.12/inferencesh-cli-v1.14.12-linux-arm64.tar.gz"
      sha256 "e83e244ce00eba75929c434381453b7e85eb367482a7f1d4b158604eaa76b02f"
    else
      url "https://dist.inference.sh/cli/v1.14.12/inferencesh-cli-v1.14.12-linux-amd64.tar.gz"
      sha256 "a8e9c88b6ae988e510c1d66798f1f11b3f0e940a70c8df595ebc4421f2bc16d3"
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
