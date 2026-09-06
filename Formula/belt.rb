class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.18.21"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.21/inferencesh-cli-v1.18.21-darwin-arm64.tar.gz"
      sha256 "0444d504efbf35310a945f220a5fd07244ae122183aa3888f5919259e3a735bf"
    else
      url "https://dist.inference.sh/cli/v1.18.21/inferencesh-cli-v1.18.21-darwin-amd64.tar.gz"
      sha256 "01cf85db1f124d40972d9a2b91d9b0cb2c5286acbd3c3e1258e1f459031e315a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.18.21/inferencesh-cli-v1.18.21-linux-arm64.tar.gz"
      sha256 "60ee07d07a32c1530b34f1252df715790e8899f0d1e772f6a64abbe53cfdde60"
    else
      url "https://dist.inference.sh/cli/v1.18.21/inferencesh-cli-v1.18.21-linux-amd64.tar.gz"
      sha256 "e09a58115f34a55d3db0adc589720c43d218ff923a084b9601e6ee561b946cea"
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
