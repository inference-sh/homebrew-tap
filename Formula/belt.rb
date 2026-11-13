class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.44"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.44/inferencesh-cli-v1.28.44-darwin-arm64.tar.gz"
      sha256 "ee1bdf8e250fa6ffd93e76cbb26362346717dbda9b610f13e2388e70a7052804"
    else
      url "https://dist.inference.sh/cli/v1.28.44/inferencesh-cli-v1.28.44-darwin-amd64.tar.gz"
      sha256 "4896c357f5fd40a99c946462ad613f99ca772be05d6a82fab74ff63a379f2256"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.44/inferencesh-cli-v1.28.44-linux-arm64.tar.gz"
      sha256 "c4d85913cd16950f9691f1c473021fadc8c60f83dc0f4b6777e85643b51e02d8"
    else
      url "https://dist.inference.sh/cli/v1.28.44/inferencesh-cli-v1.28.44-linux-amd64.tar.gz"
      sha256 "0e1c5808a20def4a741a23666f9f26b083582a7625206118f4cf463a099df6b0"
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
