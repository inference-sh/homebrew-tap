class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.27"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.27/inferencesh-cli-v1.18.27-darwin-arm64.tar.gz"
      sha256 "c08d66dd1a113da6724b37ed10d71893a20d511b9e7fc8734f478a94811cdc8a"
    else
      url "https://dist.inference.sh/cli/v1.18.27/inferencesh-cli-v1.18.27-darwin-amd64.tar.gz"
      sha256 "ff7bd9953776a9a75e9fc74e2fb0d17aee4ce6f11d3a510b28ffae82bf10d240"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.27/inferencesh-cli-v1.18.27-linux-arm64.tar.gz"
      sha256 "ebcdf6a9acd36c0cd4d6e28e752633eaf420049e22b98e1007a077eb7c272a58"
    else
      url "https://dist.inference.sh/cli/v1.18.27/inferencesh-cli-v1.18.27-linux-amd64.tar.gz"
      sha256 "a9eacdad65fc1c3e7ccf3cdc918eb2f63843dabf7406660ca6026aeded5281b6"
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
