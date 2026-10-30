class Belt < Formula
  desc "CLI for inference.sh — run AI apps, manage skills, connect MCP servers"
  homepage "https://inference.sh"
  version "1.28.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.6/inferencesh-cli-v1.28.6-darwin-arm64.tar.gz"
      sha256 "207b1137924760adf35649d62e68a1b90deefb460b243bd253126b9dfd87ab66"
    else
      url "https://dist.inference.sh/cli/v1.28.6/inferencesh-cli-v1.28.6-darwin-amd64.tar.gz"
      sha256 "aee844389a67887551a0bb83cb14df062bd43543cdd0fa55fb43044e125f8bf2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://dist.inference.sh/cli/v1.28.6/inferencesh-cli-v1.28.6-linux-arm64.tar.gz"
      sha256 "b567d17854326ce9943e4bbd1ca8709be5eb555cadd867eed4f839c5f6b6299d"
    else
      url "https://dist.inference.sh/cli/v1.28.6/inferencesh-cli-v1.28.6-linux-amd64.tar.gz"
      sha256 "431202b418c649fd43da62b203322ec0471be1c6b88acaad7a5d8bceab475a54"
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
