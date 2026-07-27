class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.2/inferencesh-cli-v1.16.2-darwin-arm64.tar.gz"
      sha256 "d9f6ba3788c04fe684a9bc34633652cd0c28b633728a48d70ec334cfa6a085f5"
    else
      url "https://dist.inference.sh/cli/v1.16.2/inferencesh-cli-v1.16.2-darwin-amd64.tar.gz"
      sha256 "bc00ee59f84b793e3acdfd97617762826ab3f6c59213d3eeb16fcd3c8694e998"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.2/inferencesh-cli-v1.16.2-linux-arm64.tar.gz"
      sha256 "a2070246cd4bc29100a5ef27643a992f394fd910c2f77368e2c9718b18a5d6bf"
    else
      url "https://dist.inference.sh/cli/v1.16.2/inferencesh-cli-v1.16.2-linux-amd64.tar.gz"
      sha256 "66ead3aaf76ee4e24019c2ccfdede6e96f8c7e86f4b062a346a504a5b9373bb8"
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
