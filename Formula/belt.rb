class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.13.26"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.26-darwin-arm64.tar.gz"
      sha256 "98bd8f54dc7a0282841ff0a943a17aa3b581a44ad6516efe52702174232e121e"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.26-darwin-amd64.tar.gz"
      sha256 "37c292c7f2bba46154761badb2d4709ccf168e583331d35db4834c56fe0e5257"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.26-linux-arm64.tar.gz"
      sha256 "0376b3d926c601f7befae6ec9db5243681bb42432a8024bdc82a5b684fa9f77d"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.13.26-linux-amd64.tar.gz"
      sha256 "e10ac638a6670f86ffd9cc4cffec0fb66da3acfc8510e4155121d849c1287095"
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
