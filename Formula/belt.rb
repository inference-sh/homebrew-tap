class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.16.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.25/inferencesh-cli-v1.16.25-darwin-arm64.tar.gz"
      sha256 "1462a0dd420d2d5541b640006bc26ce8991054f00cae5d463a8c406916af8c92"
    else
      url "https://dist.inference.sh/cli/v1.16.25/inferencesh-cli-v1.16.25-darwin-amd64.tar.gz"
      sha256 "c3685465a413b7031b293efe87874c426052bf748cffaa63bbf678215389c6dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.16.25/inferencesh-cli-v1.16.25-linux-arm64.tar.gz"
      sha256 "64efa40d8aa87d48b37c97ce43f4389cdc3a927d875149ae894b14f3a6a6d79d"
    else
      url "https://dist.inference.sh/cli/v1.16.25/inferencesh-cli-v1.16.25-linux-amd64.tar.gz"
      sha256 "4ac175837ad0f3b1429719601f88d06f60de43f49effe4bf0268269ceb75dfee"
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
