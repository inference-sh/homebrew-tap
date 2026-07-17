class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.9/inferencesh-cli-v1.15.9-darwin-arm64.tar.gz"
      sha256 "9312b3531427ac8d250ba43d4ee20dd27a914417f8387117317cdfce332dbdad"
    else
      url "https://dist.inference.sh/cli/v1.15.9/inferencesh-cli-v1.15.9-darwin-amd64.tar.gz"
      sha256 "a434f8cc7ea4546654d71a886b6dcc8d48ee697c70f10d6a266c3ea2f9d6b9d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.9/inferencesh-cli-v1.15.9-linux-arm64.tar.gz"
      sha256 "c2db0a590b2387062765539f88193fe263f93e489d9a0b462018b85281f349dc"
    else
      url "https://dist.inference.sh/cli/v1.15.9/inferencesh-cli-v1.15.9-linux-amd64.tar.gz"
      sha256 "bf1df876add92274e67a1b0a5c8c1fc40b9988ef9956a3640746c5a5377cd2ac"
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
