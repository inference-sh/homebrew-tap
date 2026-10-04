class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.10/inferencesh-cli-v1.19.10-darwin-arm64.tar.gz"
      sha256 "bf1984256454f2f6ed91cbb2b035c5699cb44b117a0d88712e8931e7365c82f0"
    else
      url "https://dist.inference.sh/cli/v1.19.10/inferencesh-cli-v1.19.10-darwin-amd64.tar.gz"
      sha256 "19f487dc660d6c4f45db21c2d809a93335cae53dcf6468ca62c9072fb906845b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.10/inferencesh-cli-v1.19.10-linux-arm64.tar.gz"
      sha256 "a47932821120eb4fc650083eb4205ad0e10614d35c81b47b655351344b3b0f71"
    else
      url "https://dist.inference.sh/cli/v1.19.10/inferencesh-cli-v1.19.10-linux-amd64.tar.gz"
      sha256 "f0068ff08305916202ed98f64247c42e7d0e157506c15a45867c8a146a6a2c6e"
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
