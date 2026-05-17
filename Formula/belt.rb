class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "v1.12.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.8-darwin-arm64.tar.gz"
      sha256 "1c9f56d24fb5f7814951cbea38edde23502e3580e7e58d328cc212336139c052"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.8-darwin-amd64.tar.gz"
      sha256 "f7ea9a7729d29ef2e3c9f10ca25354d92001529fdfe6922a875cbbef2779abfb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.8-linux-arm64.tar.gz"
      sha256 "ed2662a69ca57e69b948a05946da2dcdf74a5bb5fbd615c4e00a84feb8766984"
    else
      url "https://dist.inference.sh/cli/inferencesh-cli-v1.12.8-linux-amd64.tar.gz"
      sha256 "5b7d5c709250fed3566cf77152cadb2eb15dd1311eddb02867ac9ae02e6ac827"
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
