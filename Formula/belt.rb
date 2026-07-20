class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.15.17"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.17/inferencesh-cli-v1.15.17-darwin-arm64.tar.gz"
      sha256 "86162031b36cb1a0b0d207a4a90da18dd60be73b42f4726f07c61047e866747e"
    else
      url "https://dist.inference.sh/cli/v1.15.17/inferencesh-cli-v1.15.17-darwin-amd64.tar.gz"
      sha256 "2f4e7c6eab0eb40846f0c392f495a406d5200c70bdcecd10885506f5206eb0bc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.15.17/inferencesh-cli-v1.15.17-linux-arm64.tar.gz"
      sha256 "c403324a68876642be13c6208d13caedcbd8cfc1bb9c09316756e928591512c0"
    else
      url "https://dist.inference.sh/cli/v1.15.17/inferencesh-cli-v1.15.17-linux-amd64.tar.gz"
      sha256 "701c4bd971a7a41e206a3f995345ad440983072472a4bbf9570405f000f239fc"
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
