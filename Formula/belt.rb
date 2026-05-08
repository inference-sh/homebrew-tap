class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.9.16"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.16-darwin-arm64.tar.gz"
      sha256 "2e3076f7b9660cf6c67bbd1ee037d179f4dfe3115748f4da265ca0138fa6282e"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.16-darwin-amd64.tar.gz"
      sha256 "f8e164cc75235ca698279af9d10b87979578a5c2f1e3b26fee9bd80d2ee00433"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.16-linux-arm64.tar.gz"
      sha256 "037093badcedfbe98abd91c41aa63cc778d0c8f80aa37bc3510ef24e6eb7a592"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.9.16-linux-amd64.tar.gz"
      sha256 "d6e4113b03fcad9d9bfa6019cef457c8f94c9b3c00fb992343eb6a2284cc280f"
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
