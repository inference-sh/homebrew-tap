class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.18-darwin-arm64.tar.gz"
      sha256 "86f739f3bad4f2195a6132d5a3ec075bbbc396cbf8f527496a787785aaa9842c"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.18-darwin-amd64.tar.gz"
      sha256 "28fc8320cde56cb70f1ff069c6e043d75e6a32f2a61c6fee84d93cc4d76e057a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.18-linux-arm64.tar.gz"
      sha256 "1bd0e38058b54eca43f4c0900420cbb76d41aefe1ec55a58f70d2682d09154ad"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.18-linux-amd64.tar.gz"
      sha256 "646d2f666f1ca3be3fa5a1717cab3cbb1fbd863eb3ae40ecdbc6ea72f872ea2a"
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
