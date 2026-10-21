class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.26.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.8/inferencesh-cli-v1.26.8-darwin-arm64.tar.gz"
      sha256 "43d8585be3f8d2bb6d1f5822f2f66ee6d15f793a0406a9d0ccf3bb12cdda8a9d"
    else
      url "https://dist.inference.sh/cli/v1.26.8/inferencesh-cli-v1.26.8-darwin-amd64.tar.gz"
      sha256 "11d5ab1ae20cf12bae1e2fee53ecaea2cea444a4bfb6a118e550734a5ca1f907"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.26.8/inferencesh-cli-v1.26.8-linux-arm64.tar.gz"
      sha256 "99c3876f57a829c682f0c3dfd0cea173d928a73bb647a09052d68236924cd1a7"
    else
      url "https://dist.inference.sh/cli/v1.26.8/inferencesh-cli-v1.26.8-linux-amd64.tar.gz"
      sha256 "1c6331c5a3b3e499bf09012e0473580ac54afbdab7766970439addf40ce87dca"
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
