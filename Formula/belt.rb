class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.19.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.4/inferencesh-cli-v1.19.4-darwin-arm64.tar.gz"
      sha256 "3c2df2455a8ae553ec9873e87709d2c677096906543916653f1b3149ae7d4d21"
    else
      url "https://dist.inference.sh/cli/v1.19.4/inferencesh-cli-v1.19.4-darwin-amd64.tar.gz"
      sha256 "32de1656f960172c7ab27e8079fc5f53eeb6b149f243b9af7718ff2caade6dd4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.19.4/inferencesh-cli-v1.19.4-linux-arm64.tar.gz"
      sha256 "acdf5ca1ab5e3c53f6ec17b08e93bd7ed48cb70f787cbf06862eb46970f15381"
    else
      url "https://dist.inference.sh/cli/v1.19.4/inferencesh-cli-v1.19.4-linux-amd64.tar.gz"
      sha256 "cb731ce2ec366f7f25288bb75800a3787b621bdd1424150ad00fef83a20d4b69"
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
