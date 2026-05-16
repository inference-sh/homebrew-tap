class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.11.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.21-darwin-arm64.tar.gz"
      sha256 "733a4f34c486a93c3fd0d7665aa915b3846188478fb20c001abafd94f0dffb0b"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.21-darwin-amd64.tar.gz"
      sha256 "23ddade23e3152a5ddca284917e02757e5e87e8b55fb9113e145ad6b5a715d1b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.21-linux-arm64.tar.gz"
      sha256 "b1985499d0568001418f6e69ccc7fefc2b095c5e90b5c961af9832ab82140597"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.11.21-linux-amd64.tar.gz"
      sha256 "cdeb6508954672ec6852c9edfad9612251d26b68cb3ee012f8c8d0a9790513b8"
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
