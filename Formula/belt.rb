class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.17.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.4/inferencesh-cli-v1.17.4-darwin-arm64.tar.gz"
      sha256 "c02cb4e8940a00f7ef1cd86fae220a579f1c8c0db377f60eafe4c138db0217d1"
    else
      url "https://dist.inference.sh/cli/v1.17.4/inferencesh-cli-v1.17.4-darwin-amd64.tar.gz"
      sha256 "5b88cc7cb40b0ad56848de09d6891fb24015012ce827c19ab38fc0eace0bed2a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.17.4/inferencesh-cli-v1.17.4-linux-arm64.tar.gz"
      sha256 "b24c6e8ae155180b8a400ddb95b9683abb750a82e4953bdfafeca18349c57594"
    else
      url "https://dist.inference.sh/cli/v1.17.4/inferencesh-cli-v1.17.4-linux-amd64.tar.gz"
      sha256 "b42148df2596e8aeab81714ca764c99b7d40647df4dbbf34f24907c4d1f26150"
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
