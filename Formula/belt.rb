class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.9/inferencesh-cli-v1.16.9-darwin-arm64.tar.gz"
      sha256 "f257d3c39322093cb713a1cd7c2084835ba5bf4d6979a1f2c154380a47fb87aa"
    else
      url "https://dist.inference.sh/cli/v1.16.9/inferencesh-cli-v1.16.9-darwin-amd64.tar.gz"
      sha256 "3b652c90d1bf1d94e1b1ca34af46f9452d77df1dc7434b0067d1c491c4b9aa7b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.9/inferencesh-cli-v1.16.9-linux-arm64.tar.gz"
      sha256 "0bc46901daa91660f45beac262b5cf7bf628e3bff54d7af95baae1e288570217"
    else
      url "https://dist.inference.sh/cli/v1.16.9/inferencesh-cli-v1.16.9-linux-amd64.tar.gz"
      sha256 "0075f00c1827d80442296403d0ffd2c420b306cc633c4a3f169b97c3fc1cb97c"
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
