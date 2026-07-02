class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.14.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.8-darwin-arm64.tar.gz"
      sha256 "026a79fbe18088a98f0c88926207348dad1552eff9fab64954d329076759267c"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.8-darwin-amd64.tar.gz"
      sha256 "0726b98e6787fa474605678dc91c442fdbc39f7413b998cbe9064151063c1ad8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.8-linux-arm64.tar.gz"
      sha256 "6175b2d01fdcdd67225bfc3dfdf4739b25321272c87bae8d75cbcb72db1acada"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.14.8-linux-amd64.tar.gz"
      sha256 "217c661573e72e8d2478066c6367a404700f987e3b75b83f8fd0378ea32ddfba"
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
